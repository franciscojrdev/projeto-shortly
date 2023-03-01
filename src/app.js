import express from "express";
import dotenv from "dotenv";
import cors from "cors";
import authRouter from "./routes/auth.routes.js";
import urlsRouter from "./routes/urls.routes.js";
import userRouter from "./routes/users.routes.js";
import rankingRouter from "./routes/ranking.routes.js";

dotenv.config();

const server = express();

server.use(cors());
server.use(express.json());

server.use([authRouter, urlsRouter,userRouter,rankingRouter])

const port = process.env.PORT || 5000;

server.listen(port, () => {
  console.log(`Server running in port ${port}`);
});
