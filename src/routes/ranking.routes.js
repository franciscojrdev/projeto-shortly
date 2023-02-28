import { Router } from "express";
import { listRankingUsers } from "../controllers/ranking.controller.js";

const rankingRouter = Router();

rankingRouter.get("/ranking",listRankingUsers);

export default rankingRouter;
