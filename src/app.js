import express from "express";
import dotenv from "dotenv";
import cors from "cors";
import authRouter from "./routes/auth.routes.js";
import urlsRouter from "./routes/urls.routes.js";
import userRouter from "./routes/users.routes.js";

dotenv.config();

const server = express();

server.use(cors());
server.use(express.json());

server.use([authRouter, urlsRouter,userRouter])

server.listen(process.env.PORT, () => {
  console.log(`Server running in port ${process.env.PORT}`);
});
