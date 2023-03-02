import { db } from "../config/database.js";

export const authValidation = async (req,res,next) => {
    const { authorization } = req.headers;

    const token = authorization?.replace("Bearer ", "");

    if(!token) return res.sendStatus(401)

    try {
        const session = await db.query(`SELECT * FROM sessions WHERE token = $1;`,[token])

        if(session.rowCount === 0){
            return res.sendStatus(401)
        }
        res.locals.session = {...session.rows[0]}
        next()
    } catch (error) {
        res.status(500).send(error.message)
    }
}