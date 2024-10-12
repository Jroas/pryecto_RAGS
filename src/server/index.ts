import express,{ Express, Request,  Response } from "express";



//Security 
import cors from "cors";
import helmet from "helmet";


//TODO HTPPS

//Routs Router

import rootRouter from '../routes';



//* Create expresss app 
const server: Express =express();


//*Define SERVER to use /api and use rootRouter from "index.ts in routes"
//Fro this poit onover: http://localhost:8000/api/...
server.use(
    "/api",rootRouter
);

//TODO MONGOSE Conection


//*Security config 
server.use(helmet());
server.use(cors());

//*Content Type Config
server.use(express.urlencoded({extended:true, limit:"50mb"}));
server.use(express.json({limit:"50mb"}));


// * RedirectionConfig
//https:localhost:8000/ -> //https:localhost:8000/api/
server.get('/' , (req: Request , res: Response )=>{
    res.redirect("/api");

});

export default server;

