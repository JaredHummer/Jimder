import { Router } from "express";
import { create } from "./create";
import { login } from "./login";
import { getCategory, postCategory } from "./category";

import { pool } from "@/db";

export const account = Router();

account.get("/category",  getCategory);
account.post("/category", postCategory);
account.post("/create",   create);
account.post("/login",    login);

account.get("/", async (request, response) => {
    response.json((await pool.query("select 'hello world'::text")).rows);
});
