import express, { json } from "express";
import connectDB from "./config/db.js";

const app=express();

const PORT=8000;

connectDB();

app.get("/",(req,res)=>
{
    console.log("Get Request handled for '/' route");
    res.send("<h1>Hey there</h1>");
});

app.listen(PORT,()=>{
    console.log(`Server is running at http://localhost:${PORT}`);
});



