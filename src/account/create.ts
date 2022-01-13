import { Request, Response } from "express";
import { z } from "zod";
import { hash, argon2id } from "argon2";

import { pool } from "@/db";
import { hashPassword } from "@/pwd-util";
import { signAccount } from "@/jwt-util";

const schema = z.object({
    username: z.string(),
    password: z.string(),
});

const randomPictureUrl = () => {
    const i = Math.floor(Math.random() * 9);
    return `https://randomuser.me/api/portraits/lego/${i}.jpg`;
}

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
            error: "username invalid",
        });
        return;
    }

    const hash = await hashPassword(body.password);

    if (hash === null) {
        response.status(400);
        response.json({
            success: false,
            error: "password invalid"
        });
        return;
    }

    const result = await pool.query(
        "insert into account (username, password, picture_url, description, contact_info) values ($1, $2, $3, '', '') on conflict do nothing returning id",
        [body.username, hash, randomPictureUrl()]
    );

    if (result.rowCount === 0) {
        response.status(409);
        response.json({
            success: false,
            error: "username already in use"
        });
        return;
    }

    const [id] = result.rows[0];

    response.status(200);
    response.json({
        success: true,
        token: signAccount(id),
    });
};
