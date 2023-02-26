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

export const signIn = async (req,res) => {
    const {name,password} = 
}
