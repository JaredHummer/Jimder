import { Request, Response } from "express";
import { z } from "zod";
import { hash, argon2id } from "argon2";

import { Account, AccountCategory, pool } from "@/db";

const schema = z.object({
    username: z.string(),
    password: z.string(),
});

export const create = async (request: Request, response: Response) => {
    const parse = schema.safeParse(request.body);

    if (!parse.success) {
        response.status(400);
        response.json({
            success: false,
            error: "body does not match schema",
        });
        return;
    }

    const body = parse.data;

    if (!/^[a-zA-Z0-9_\-\.]{3,20}$/.test(body.username)) {
        response.status(400);
        response.json({
            success: false,
            error: "username invalid"
        });
        return;
    }

    console.log(/^.{3,}$/.test(body.password))
    console.log(/[a-z]/.test(body.password))
    console.log(/[A-Z]/.test(body.password))
    console.log(/[0-9]/.test(body.password))

    if (!/^.{3,}$/.test(body.password)
        || !/[a-z]/.test(body.password)
        || !/[A-Z]/.test(body.password)
        || !/[0-9]/.test(body.password)) {
        response.status(400);
        response.json({
            success: false,
            error: "password invalid"
        });
        return;
    }

    const password_hash = await hash(body.password, {
        type: argon2id,
        timeCost: 5,
        memoryCost: 256 * 1024,
    });

    const result = await pool.query(
        "insert into account (username, password) values ($1, $2) on conflict do nothing;",
        [body.username, password_hash]
    );

    if (result.rowCount === 0) {
        response.status(409);
        response.json({
            success: false,
            error: "username already in use"
        });
        return;
    }

    response.status(200);
    response.json({
        success: true,
    });
};
