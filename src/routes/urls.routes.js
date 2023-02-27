import { Router } from "express";
import { createShortenUrl } from "../controllers/urls.controller.js";
import { authValidation } from "../middlewares/auth.middleware.js";
import { validateSchema } from "../middlewares/validate.schema.js";
import { urlsSchema } from "../schemas/urls.schema.js";

const urlsRouter = Router();

urlsRouter.post("/urls/shorten",authValidation,validateSchema(urlsSchema),createShortenUrl);
urlsRouter.get("/urls/:id");
urlsRouter.get("/urls/open/:shortUrl");
urlsRouter.delete("/urls/:id");

export default urlsRouter;
