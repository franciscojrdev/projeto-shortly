import { Router } from "express";
import { listUsers } from "../controllers/users.controller.js";
import { authValidation } from "../middlewares/auth.middleware.js";

const userRouter = Router();

userRouter.get("/users/me",authValidation,listUsers);

export default userRouter;
