import { Request, Response } from "express";
import { z } from "zod";

import { verifyAccount } from "@/jwt-util";
import { pool } from "@/db";
import { Int32 } from "mongodb";
import { PoolClient } from "pg";

export const next = async (request: Request, response: Response) => {
    const accountId = verifyAccount(request.header("authorization") ?? "");

    if (accountId === null) {
        response.status(401);
        response.json({
            success: false,
            error: "invalid authn",
        });
        return;
    }

    const client = await pool.connect();

    const outstandingResult = await client.query(
        "select subject_id from impression where receiver_id = $1 and accepted is null order by id asc limit 1", [accountId]
    );

    if (outstandingResult.rows.length === 1) {
        console.log("outstanding: " + outstandingResult.rows);

        client.release();

        const id = outstandingResult.rows[0].subject_id;
        getOtherUserCategories(response, client, id, accountId);
        return;
    }

    const result = await client.query(
        `
            select b.account_id
                from account_category a
                join account_category b on a.category_id = b.category_id
            where a.account_id = $1
              and b.account_id != a.account_id
              and a.enabled = true
              and b.enabled = true
              and b.account_id <> all(select receiver_id from impression where subject_id = $1)
              and b.account_id <> all(select subject_id from impression where receiver_id = $1)
            group by b.account_id
            order by count(1) desc
            limit 1
        `,
        [accountId],
    );

    client.release();

    console.log(result.rows);
    if (result.rows.length === 0) {
        response.status(400);
        response.json({
            success: false,
            error: "lol ur lonely"
        });
        return;
    }

    const id = result.rows[0].account_id;

    getOtherUserCategories(response, client, id, accountId);
    return;
};

const getCatSchema = z.object({
    account_id: z.string().transform((val) => parseInt(val))
});

async function getOtherUserCategories(response: Response, client: PoolClient, other_id: number, account_id: number) {

    const result = await client.query(
        `select category.name, account_category.description 
        from category join account_category on category.id = account_category.category_id 
            where account_category.account_id = $1 
            and account_category.category_id in (select category_id from account_category where account_id = $2)`, [other_id, account_id])

    const categories = result.rows

    const accResult = await client.query(
        "select username, picture_url, description, id as other_id from account where id = $1 limit 1", [other_id]
    )

    const account_info = accResult.rows[0];

    response.status(200);
    response.json({
        success: true,
        categories,
        account_info
    });
}

