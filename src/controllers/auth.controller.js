import { db } from "../config/database.js";

export const signUp = async (req, res) => {
  const { name, email, password } = res.locals.user;
  try {
    await db.query(
      `INSERT INTO users(name,email,password) VALUES ($1,$2,$3);`,
      [name, email, password]
    );
    res.sendStatus(201);
  } catch (error) {
    res.status(500);
  }
};

export const signIn = async (req, res) => {
  const { userId, token } = res.locals.userData;
  try {
    const { rowCount } = await db.query(
      `SELECT * FROM sessions WHERE "userId" = $1;`,
      [userId]
    );

    if (rowCount !== 0) {
      await db.query(`UPDATE sessions SET token = $1 WHERE "userId" = $2;`, [
        token,
        userId,
      ]);
    } else {
      await db.query(`INSERT INTO sessions (token,"userId") VALUES ($1,$2);`, [
        token,
        userId,
      ]);
    }
    res.status(200).send({ token: token });
  } catch (error) {
    res.status(500).send(error.message);
  }
};
