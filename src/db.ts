import { Pool } from "pg";

export const pool = new Pool({
    idleTimeoutMillis: 0,
    host: "35.231.132.216",
    user: "postgres",
    password: "jinderDaBest"
});
