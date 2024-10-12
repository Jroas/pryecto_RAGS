/**
 * Root router 
 * Refirectio to routers 
 * 
 */

import express, { Request,Response } from "express";
import helloRouter from "./HelloRouter";
import { logInfo } from "@/utils/logger";

// Server intance

let server= express();

//Route instance 
let rootRouter= express.Router();

//Activate for requests to http://localhost:8000/api

rootRouter.get ('/', (req: Request , res: Response) => {
    logInfo('GET:http://localhost:8000/api')

    //Send Hello word
    res.send('Welcom to the hello word ');
});

//Reirection ro Router&Controllers 
server.use("/",rootRouter);//http://localhost:8000/api
server.use("/hello",helloRouter);//http://localhost:8000/api ->HelloRoute
//Add more routes to th app 

export default server;

