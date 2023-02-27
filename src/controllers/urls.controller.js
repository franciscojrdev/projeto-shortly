import { nanoid } from "nanoid"
import { db } from "../config/database.js"

export const createShortenUrl = async (req,res) =>{
    const {id} = res.locals.session
    const {url} = req.body
    try {
        const shortUrl = nanoid(10)
        const resultado = await db.query(`INSERT INTO urls("shortUrl",url) VALUES ($1,$2);`,[shortUrl,url])
        console.log(id)
        console.log(resultado)
        res.status(201).send("deu bom")
    } catch (error) {
        res.status(500).send(error.message)
    }
}