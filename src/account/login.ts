import { Request, Response } from "express";
import { z } from "zod";
import { pool } from "@/db";
import { signAccount } from "@/jwt-util";
import { verifyPassword } from "@/pwd-util";

const schema = z.object({
    username: z.string(),
    password: z.string(),
});

export const login = async (request: Request, response: Response) => {
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
    const result = await pool.query("select id, password from account where username = $1", [body.username]);

    if (result.rows.length === 0) {
        response.status(404);
        response.json({
            success: false,
            error: "user does not exist",
        });
        return;
    }

    const [id, hash] = result.rows[0];

    if (!verifyPassword(body.password, hash)) {
        response.status(401);
        response.json({
            success: false,
            error: "incorrect password",
        });
        return;
    }

    response.status(200);
    response.json({
        success: true,
        token: signAccount(id),
    });
};
