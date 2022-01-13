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

    const outstandingResult = await client.query();
};
