import { Router } from "express";
import { createShortenUrl, deleteUrl, listShortUrl, openShortenUrl } from "../controllers/urls.controller.js";
import { authValidation } from "../middlewares/auth.middleware.js";
import { validateSchema } from "../middlewares/validate.schema.js";
import { urlsSchema } from "../schemas/urls.schema.js";

const urlsRouter = Router();

urlsRouter.post("/urls/shorten",authValidation,validateSchema(urlsSchema),createShortenUrl);
urlsRouter.get("/urls/:id",listShortUrl);
urlsRouter.get("/urls/open/:shortUrl",openShortenUrl);
urlsRouter.delete("/urls/:id",authValidation,deleteUrl);

export default urlsRouter;
