import { Pool } from "pg";

export const pool = new Pool({
    idleTimeoutMillis: 0
});
