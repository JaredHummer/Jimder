import { Request, Response, Router } from "express";

import { pool } from "@/db";
import { verifyAccount } from "@/jwt-util";
import { z } from "zod";

export const matches = async (request: Request, response: Response) => {
    const accountId = verifyAccount(request.header("authorization") ?? "");

    if (accountId === null) {
        response.status(401);
        response.json({
            success: false,
            error: "invalid authn",
        });
        return;
    }

    const result = await pool.query("select subject_id from impression where receiver_id = $1 and accepted = true", [accountId]);
    const matches = result.rows.map(([match]) => match);

    response.status(200);
    response.json({
        success: true,
        matches,
    });
};
