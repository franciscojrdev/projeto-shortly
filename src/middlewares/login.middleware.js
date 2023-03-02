import { db } from "../config/database.js";
import { userLoginSchema, userSchema } from "../schemas/login.schema.js";
import bcrypt from "bcrypt";
import { v4 as uuid } from "uuid";

export const signUpValidation = async (req, res, next) => {
  const user = req.body;

  const { error } = userSchema.validate(user, { abortEarly: false });

  if (error) {
    const errorMessage = error.details.map((detail) => detail.message);
    return res.status(422).send(errorMessage);
  }

  const { rowCount } = await db.query(`SELECT * FROM users WHERE email = $1;`, [
    user.email,
  ]);
  if (rowCount !== 0) {
    return res.sendStatus(409);
  }

  const passwordHash = bcrypt.hashSync(user.password, 10);

  delete user.confirmPassword;

  res.locals.user = { ...user, password: passwordHash };
  next();
};

export const signInValidation = async (req, res, next) => {
  const { email, password } = req.body;

  const { error } = userLoginSchema.validate(
    { email, password },
    { abortEarly: false }
  );

  if (error) {
    const errorMessage = error.details.map((detail) => detail.message);
    return res.status(422).send(errorMessage);
  }

  const userData = await db.query(`SELECT * FROM users WHERE email = $1;`, [
    email,
  ]);

  if (
    userData.rowCount &&
    bcrypt.compareSync(password, userData.rows[0].password)
  ) {
    const token = uuid();

    res.locals.userData = { userId: userData.rows[0].id, token };
    next();
  } else {
    res.status(401).send("email or password invalid!");
  }
};
