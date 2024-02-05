import express, { json } from "express";

const app=express();

const PORT=8000;

app.get("/",(req,res)=>
{
    console.log("Get Request handled for '/' route");
    res.send("<h1>Hey there</h1>");
});

app.listen(PORT,()=>{
    console.log(`Server is running at http://localhost:${PORT}`);
});