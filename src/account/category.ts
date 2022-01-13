import { Request, Response } from "express";
import { z } from "zod";

import { verifyAccount } from "@/jwt-util";
import { pool } from "@/db";

const postSchema = z.object({
    category_id: z.number().positive().int(),
    enabled:     z.boolean(),
    description: z.string(),
});

export const postCategory = async (request: Request, response: Response) => {
    const account_id = verifyAccount(request.header("authorization") ?? "");

    if (account_id === null) {
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
    const client = await pool.connect();

    if ((await client.query("select category_id from category where category_id = $1", [body.category_id])).rows.length === 0) {
        client.release();

        response.status(400);
        response.json({
            success: false,
            error: "invalid category",
        });
        return;
    }

    await pool.query(
        "insert into account_category (account_id, category_id, enabled, description) ($1, $2, $3, $4) on conflict do update set enabled = $3, description = $4",
        [account_id, body.category_id, body.enabled, body.description],
    );
    client.release();

    response.status(200);
    response.json({
        success: true,
    });
    return;
};

const getSchema = z.object({
    categoryId: z.number().positive().int(),
});

export const getCategory = async (request: Request, response: Response) => {
    const accountId = verifyAccount(request.header("authorization") ?? "");

    if (accountId === null) {
        response.status(401);
        response.json({
            success: false,
            error: "invalid authn",
        });
        return;
    }

    const parse = getSchema.safeParse(request.query);

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

    if ((await client.query("select category_id from category where category_id = $1", [query.categoryId])).rows.length === 0) {
        client.release();

        response.status(400);
        response.json({
            success: false,
            error: "invalid category",
        });
        return;
    }

    const result = await client.query(
        "select enabled, description from account_category where account_id = $1 and category_id = $2",
        [accountId, query.categoryId],
    );
    client.release();

    if (result.rows.length === 0) {
        response.status(200);
        response.json({
            success: true,
            exists: false,
        });
        return;
    }

    const [enabled, description] = result.rows[0];

    response.status(200);
    response.json({
        success: true,
        exists: true,
        enabled,
        description,
    });
};
