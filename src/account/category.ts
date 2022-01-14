import { Request, Response } from "express";
import { z } from "zod";

import { verifyAccount } from "@/jwt-util";
import { pool } from "@/db";
import { Client } from "pg";

const postSchema = z.object({
    categoryId:  z.number().positive().int(),
    enabled:     z.boolean(),
    description: z.string(),
});

export const postCategory = async (request: Request, response: Response) => {
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
    const client = await pool.connect();

    console.log(body);

    if ((await client.query("select id from category where id = $1", [body.categoryId])).rows.length === 0) {
        client.release();

        response.status(400);
        response.json({
            success: false,
            error: "invalid category",
        });
        return;
    }

    await pool.query(
        "insert into account_category (account_id, category_id, enabled, description) values ($1, $2, $3, $4) on conflict (account_id, category_id) do update set enabled = $3, description = $4",
        [accountId, body.categoryId, body.enabled, body.description],
    );
    client.release();

    response.status(200);
    response.json({
        success: true,
    });
    return;
};

const getSchema = z.object({
    categoryId: z.string().transform((val) => parseInt(val))
});

export const getCategory = async (request: Request, response: Response) => {
    const accountId = verifyAccount(request.header("authorization") ?? "");

    console.log(accountId, )

    if (accountId === null) {
        response.status(401);
        response.json({
            success: false,
            error: "invalid authn",
        });
        return;
    }

    console.log(request.query)

    const parse = getSchema.safeParse(request.query);

    console.log(parse);

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

    if ((await client.query("select id from category where id = $1", [query.categoryId])).rows.length === 0) {
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

    const [enabled, description] = [result.rows[0].enabled, result.rows[0].description];

    response.status(200);
    response.json({
        success: true,
        exists: true,
        enabled,
        description,
    });
};

export const getAllCategories = async (request: Request, response: Response) => {
    const client = await pool.connect();
    const result = await client.query("select * from category")

    response.status(200);
    response.json({
        success: true,
        categories: result.rows
    });
}