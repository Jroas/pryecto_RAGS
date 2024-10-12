import dotenv from 'dotenv';
import server from '@/server';
import { logError, logSucces } from '@/utils/logger';

//*Configuration the .env file 
dotenv.config();

const port = process.env.PORT || 8000;

//*Execute SERVER

server.listen(port, ()=>{
    logSucces("SERVER ON: Running in https//localhost:"+port+"/api")
});

//*Control SERVER ERROR 
server.on("error", (error)=>{
    logError("SERVER ERROR: "+error)
});
