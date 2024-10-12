"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const dotenv_1 = __importDefault(require("dotenv"));
const server_1 = __importDefault(require("@/server"));
const logger_1 = require("@/utils/logger");
//*Configuration the .env file 
dotenv_1.default.config();
const port = process.env.PORT || 8000;
//*Execute SERVER
server_1.default.listen(port, () => {
    (0, logger_1.logSucces)("SERVER ON: Running in https//localhost:" + port + "/api");
});
//*Control SERVER ERROR 
server_1.default.on("error", (error) => {
    (0, logger_1.logError)("SERVER ERROR: " + error);
});
//# sourceMappingURL=index.js.map