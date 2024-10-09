"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const dotenv_1 = __importDefault(require("dotenv"));
//Config env file 
dotenv_1.default.config();
// Create expresss app 
const app = (0, express_1.default)();
const port = process.env.PORT || 8000;
//Define the forts Route of App 
app.get('/', (req, res) => {
    //Send Hello word
    res.send('Welcom to the jungle sdfadfasdf');
});
//Define the forts Route of App 
app.get('/hello', (req, res) => {
    //Send Hello word
    res.send('Welcom to the hello word ');
});
//Execute app ande Listen Resquest to port  
app.listen(port, () => {
    //Send Hello word
    console.log("Expres Server: Runing at: http://localhost:" + port);
});
//# sourceMappingURL=index.js.map