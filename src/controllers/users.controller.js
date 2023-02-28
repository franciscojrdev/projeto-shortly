import { db } from "../config/database.js";

export const listUsers = async (req, res) => {
  const { id } = res.locals.session;

  try {
    const { rows: findUserData } = await db.query(
      `
        SELECT u.id,u.name, sum(ur."visitCount") as "visitCount"
        FROM sessions s
        JOIN users u
	        ON u.id = s."userId"
        JOIN "sessionsUrls" su
	        ON s.id = su."sessionId"
        JOIN urls ur
	    ON ur.id = su."urlsId"
        WHERE s.id = $1
        GROUP BY u.id;
        `,
      [id]
    );
    const { rows: findUrls } = await db.query(
      `
        SELECT u.id, u."shortUrl",u.url, u."visitCount"
        FROM sessions s
        JOIN "sessionsUrls" su
            ON s.id = su."sessionId"
        join urls u
            ON u.id = su."urlsId"
        WHERE s.id = $1;`,
      [id]
    );
    const resultado = { ...findUserData[0], shortenedUrls: findUrls };

    res.status(200).send(resultado);
  } catch (error) {
    res.status(500).send(error.message);
  }
};
