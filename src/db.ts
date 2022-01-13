import { Pool } from "pg";

export const pool = new Pool({
    idleTimeoutMillis: 0
});

export interface Account {
    id:         number,
    username:   string,
    password:   string,
}

export interface AccountCategory {
    id:          number,
    account_id:  number,
    category_id: number,
    enabled:     boolean,
    description: string,
}
