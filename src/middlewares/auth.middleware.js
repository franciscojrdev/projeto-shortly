import { db } from "../config/database";

export const authValidation = async (req,res,next) => {
    const { authorization } = req.headers;

    const token = authorization?.replace("Bearer ", "");

    if(!token) return res.sendStatus(401)

    try {
        const { rows:sessions } = await db.query(`SELECT * FROM sessions WHERE token = $1;`[token])

        if(!rows){
            return res.sendStatus(401)
        }
    } catch (error) {
        res.status(500).send(error.message)
    }
}