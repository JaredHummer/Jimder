import { Request, Response, Router } from "express";
import { next } from "./next";

import { pool } from "@/db";
import { z } from "zod";
import { verifyAccount } from "@/jwt-util";

export const account = Router();

const schema = z.object({
    impressionId: z.number().positive().int().optional(),
});

account.post("/next", next);
account.get("/", async (request: Request, response: Response) => {
    const accountId = verifyAccount(request.header("authorization") ?? "");

    if (accountId === null) {
        response.status(401);
        response.json({
            success: false,
            error: "invalid authn",
        });
        return;
    }

    const parse = schema.safeParse(request.query);

    if (!parse.success) {
        response.status(400);
        response.json({
            success: false,
            error: "query does not match schema",
        });
        return;
    }

    const query = parse.data;
    const client = await pool.connect();

    if (query.impressionId === undefined) {
        const result = await client.query("select subject_id from impression where receiver_id = $1 and accepted = true", [accountId]);
        const matches = result.rows.map(([match]) => match);

        client.release();

        response.status(200);
        response.json({
            success: true,
            matches,
        });
        return;
    }

    const result = await client.query("select username, picture_url, description, contact_info, accepted from account join impression on account_id = subject_id where ")

    const [username, pictureUrl, description, contactInfo] = result.rows[0];

    response.status(200);
    response.json({
        success: true,
        username,
        pictureUrl,
        description,
        contactInfo,
    });
});
