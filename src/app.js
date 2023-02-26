import express from "express";
import dotenv from "dotenv";
import cors from "cors";
import authRouter from "./routes/auth.routes.js";

dotenv.config();

const server = express();

server.use(cors());
server.use(express.json());

server.use([authRouter])

server.listen(process.env.PORT, () => {
  console.log(`Server running in port ${process.env.PORT}`);
});
