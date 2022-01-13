import { Request, Response } from "express";
import { z } from "zod";

import { verifyAccount } from "@/jwt-util";
import { pool } from "@/db";

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
        "select id from impression where receiver_id = $1 order by created_at asc limit 1",
    );

    if (outstandingResult.rows.length === 1) {
        client.release();

        const [id] = outstandingResult.rows[0];
        response.status(200);
        response.json({
            success: true,
            id,
        });
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
              and b.account_id != all(select subject_id from impression where receiver_id = a.account_id)
            group by b.account_id
            order by count(1) desc
            limit 1
        `,
        [accountId],
    );

    client.release();

    if (result.rows.length === 0) {
        response.status(400);
        response.json({
            success: false,
            error: "lol ur lonely"
        });
        return;
    }

    const [id] = outstandingResult.rows[0];

    response.status(200);
    response.json({
        success: true,
        id,
    });
    return;
};
