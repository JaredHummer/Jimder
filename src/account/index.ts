import { Request, Response, Router } from "express";
import { create } from "./create";
import { login } from "./login";
import { getCategory, postCategory } from "./category";

import { pool } from "@/db";
import { verifyAccount } from "@/jwt-util";
import { z } from "zod";

export const account = Router();

account.get("/category",  getCategory);
account.post("/category", postCategory);
account.post("/create",   create);
account.post("/login",    login);

account.get("/", async (request: Request, response: Response) => {
    const account_id = verifyAccount(request.header("authorization") ?? "");

    if (account_id === null) {
        response.status(401);
        response.json({
            success: false,
            error: "invalid authn",
        });
        return;
    }

    const result = await pool.query("select username, picture_url, description, contact_info from account where id = $1", [account_id]);
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

const postSchema = z.object({
    pictureUrl: z.string(),
    description: z.string(),
    contactInfo: z.string(),
});

account.post("/", async (request: Request, response: Response) => {
    const accountId = verifyAccount(request.header("authorization") ?? "");

    if (accountId === null) {
        response.status(401);
        response.json({
            success: false,
            error: "invalid authn",
        });
        return;
    }

    const parse = postSchema.safeParse(request.body);

    if (!parse.success) {
        response.status(400);
        response.json({
            success: false,
            error: "body does not match schema",
        });
        return;
    }

    const body = parse.data;

    await pool.query(
        "update account set picture_url = $1, description = $2, contact_info = $3 where id = $4",
        [body.pictureUrl, body.description, body.contactInfo, accountId],
    );

    response.status(200);
    response.json({
        success: true,
    });
});
