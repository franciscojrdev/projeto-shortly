import { Router } from "express";
import { signIn, signUp } from "../controllers/auth.controller.js";
import { signInValidation, signUpValidation } from "../middlewares/login.middleware.js";

const authRouter = Router();

authRouter.post("/signup",signUpValidation,signUp);
authRouter.post("/signin",signInValidation,signIn);

export default authRouter;
