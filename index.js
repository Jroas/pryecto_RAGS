const express= require("express");
const dotenv= require("dotenv");

//Config env file 
dotenv.config();

// Create expresss app 
const app=express();
const port=process.env.PORT ||   8000;

//Define the forts Route of App 
app.get ('/', (req, res) => {
    //Send Hello word
    res.send('Welcom to the jungle');
});


//Execute app ande Listen Resquest to port  
app.listen (port, () => {
    //Send Hello word
    console.log('Expres Server: Runing at: http://localhost:8000');
});

