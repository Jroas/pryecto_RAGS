import { BasicResponse } from "./types";
import { IHelloController } from "./interfaces";
import { logSucces } from "@/utils/logger";

export class HelloControler implements  IHelloController{

    public async getMessage(name?: string): Promise<BasicResponse> {
        logSucces('[/api/hello] Get Request');
        return {
            message:`Hello, ${name||"wold!"}`
            
        }
    }
    
} 