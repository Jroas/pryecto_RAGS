import express , { Express,Request,Response } from "express";
import dotenv from 'dotenv';

//Config env file 
dotenv.config();

// Create expresss app 
const app: Express =express();
const port: string | number=process.env.PORT ||   8000;


//Define the forts Route of App 
app.get ('/', (req: Request , res: Response) => {
    //Send Hello word
    res.send('Welcom to the jungle sdfadfasdf');
});


//Define the forts Route of App 
app.get ('/hello', (req: Request , res: Response) => {
    //Send Hello word
    res.send('Welcom to the hello word ');
});


//Execute app ande Listen Resquest to port  
app.listen (port, () => {
    //Send Hello word
    console.log("Expres Server: Runing at: http://localhost:"+port);
});
