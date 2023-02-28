import { db } from "../config/database.js";

export const listRankingUsers = async (req, res) => {
  try {
    const { rows: findAllData } = await db.query(`
    SELECT u.id, u.name, COUNT(su."sessionId") AS "linksCount", SUM(ur."visitCount") AS "visitCount"
    FROM "sessionsUrls" su
    LEFT JOIN sessions s
        ON s.id = su."sessionId"
    LEFT JOIN users u 
        ON s."userId" = u.id
    JOIN urls ur
        ON ur.id = su."urlsId"
    GROUP BY su."sessionId",u.id,u.name
    ORDER BY "visitCount" DESC
    LIMIT 10;
        `);
    res.status(200).send(findAllData);
  } catch (error) {
    res.status(500).send(error.message);
  }
};
