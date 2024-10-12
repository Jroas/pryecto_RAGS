import express, {Request, Response } from "express";
import { HelloControler } from "@/controller/HelloController";
import { logInfo } from "@/utils/logger";
import { BasicResponse } from "@/controller/types";

//Router for Express
let helloRouter = express.Router();

//http:/localhost:8000/api/hello?name=Juancho/
helloRouter.route('/')
//GET: -> http:/localhost:8000/api/hello?name=Juancho/
    .get(async (req: Request, res: Response)=>{
        //obtain a query pararm
        let name: any =req?.query?.mane;
        logInfo(`Query Param: ${name}`);
        //Controller Instance to excute method 
        const controller:HelloControler=new HelloControler();
        //Obtain Response 
        const response: BasicResponse  = await controller.getMessage(name);
        //Send to the client reponse 
       return res.send(response);
    })
   

//Export Hello route 
export default helloRouter;