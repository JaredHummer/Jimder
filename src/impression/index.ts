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

    const result = await client.query(
        `
            select  username,
                    picture_url,
                    description,
                    contact_info,
                    exists(select 1 from impression b where b.id = a.inverse_id and b.accepted = true)
                from account
                join impression a on account.id = subject_id
            where receiver_id = $1
              and accepted != false
        `,
        [accountId],
    )

    const [username, pictureUrl, description, contactInfo, showContact] = result.rows[0];

    const categoriesResult = await client.query(
        `
            select b.category_id, c.name, b.description
                from impression
                join account_category a on a.account_id = receiver_id
                join account_category b on b.account_id = subject_id and b.category_id = a.category_id
                join category         c on c.id = a.category_id
            where a.account_id = $1
              and a.enabled = true
              and b.enabled = true
        `,
        [accountId],
    );

    const categories = categoriesResult.rows.map(([id, name, description]) => ({ id, name, description }))

    response.status(200);
    response.json({
        success: true,
        username,
        pictureUrl,
        description,
        contactInfo: showContact ? contactInfo : null,
        categories,
    });
});

// TODO: post / to set impression.accepted
// if we set it to true and impression.inverse_id is null, generate a new impression
// with receiver_id and subject_id reversed, populate inverse_id's accordingly, etc.
