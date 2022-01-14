import { Request, Response } from "express";

import { pool } from "@/db";
import { z } from "zod";
import { verifyAccount } from "@/jwt-util";

const postSchema = z.object({
    other_id: z.number(),
    swipe: z.boolean()
});

export const postSwipe = async (request: Request, response: Response) => {    
    const accountId = verifyAccount(request.header("authorization") ?? "");

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
    const checkImpressionExists = await client.query("select id from impression where receiver_id = $1 and subject_id = $2 limit 1", [accountId, body.other_id])

    if(checkImpressionExists.rows.length === 1) {
        client.query("update impression set accepted = $1 where id = $2", [body.swipe, checkImpressionExists.rows[0].id]);
    }
    else {
        if(body.swipe)
            client.query("insert into impression (receiver_id, subject_id) values ($1, $2)", [body.other_id, accountId]);
        else
            client.query("insert into impression (receiver_id, subject_id, accepted) values ($1, $2, false)", [body.other_id, accountId]);
    }

    response.status(200);
    response.json({
        'success': true
    });
    return;

}