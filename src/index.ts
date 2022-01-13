import * as express from "express";
import { Request, Response } from "express";
import * as morgan from "morgan";

import { account } from "./account";

const app = express();

app.use(morgan('dev'));
app.use(express.json());
app.use("/account", account);

app.listen(8000, () => {});
