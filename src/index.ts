import * as express from "express";
import { Request, Response } from "express";
import * as morgan from "morgan";

import { account } from "./account";
import { impression } from "./impression";

const app = express();

var cors = require('cors')

app.use(cors());

app.use(morgan('dev'));
app.use(express.json());
app.use("/account", account);
app.use("/impression", impression);

app.listen(8000, () => {});
