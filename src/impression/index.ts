import { Router } from "express";
import { next } from "./next";

import { pool } from "@/db";

export const account = Router();

account.post("/next", next);
