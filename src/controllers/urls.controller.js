import { nanoid } from "nanoid";
import { db } from "../config/database.js";

export const createShortenUrl = async (req, res) => {
  const { id } = res.locals.session;
  const { url } = req.body;
  try {
    const shortUrl = nanoid(10);

    const { rows: findShortId } = await db.query(
      `INSERT INTO urls("shortUrl",url) VALUES ($1,$2) RETURNING id,"shortUrl";`,
      [shortUrl, url]
    );

    await db.query(
      `INSERT INTO "sessionsUrls"("sessionId","urlsId") VALUES ($1,$2);`,
      [id, findShortId[0].id]
    );

    res.status(201).send(findShortId[0]);
  } catch (error) {
    res.status(500).send(error.message);
  }
};

export const listShortUrl = async (req, res) => {
  const id = Number(req.params.id);

  if (isNaN(id)) return res.sendStatus(400);

  try {
    const findUrl = await db.query(
      `SELECT id,"shortUrl",url FROM urls WHERE id = $1;`,
      [id]
    );

    if (findUrl.rowCount === 0) {
      return res.sendStatus(404);
    }
    res.status(200).send(findUrl.rows[0]);
  } catch (error) {
    res.status(500).send(error.message);
  }
};

export const openShortenUrl = async (req, res) => {
  const shortUrl = req.params.shortUrl;

  try {
    const findUrl = await db.query(
      `SELECT * FROM urls WHERE "shortUrl" = $1;`,
      [shortUrl]
    );
  
    if (findUrl.rowCount === 0) {
      return res.sendStatus(404);
    }
    let visits = findUrl.rows[0].visitCount;
    await db.query(`UPDATE urls SET "visitCount" = $1 WHERE "shortUrl" = $2;`, [
      visits + 1,
      shortUrl,
    ]);
    res.redirect(findUrl.rows[0].url);
  } catch (error) {
    res.status(500).send(error.message);
  }
};

export const deleteUrl = async (req, res) => {
  const { id } = res.locals.session;
  const urlId = Number(req.params.id);

  if (isNaN(urlId)) return res.sendStatus(400);

  try {
    const findUrl = await db.query(`SELECT * FROM urls WHERE id = $1;`, [
      urlId,
    ]);

    if (findUrl.rowCount === 0) return res.sendStatus(404);

    const findUrlSession = await db.query(
      `SELECT * FROM "sessionsUrls" WHERE "sessionId" = $1 AND "urlsId" = $2;`,
      [id, urlId]
    );

    if (findUrlSession.rowCount === 0) return res.sendStatus(401);

    await db.query(`DELETE FROM "sessionsUrls" WHERE id = $1;`, [
      findUrlSession.rows[0].id,
    ]);
    await db.query(`DELETE FROM urls WHERE id = $1;`, [urlId]);

    res.sendStatus(204);
  } catch (error) {
    res.status(500).send(error.message);
  }
};
