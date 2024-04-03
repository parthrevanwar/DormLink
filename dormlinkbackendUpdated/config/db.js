import mongoose from "mongoose";

const connectDB= async ()=>{

    // ADD IN THE MONGODB URL-------------------------------


    try{
        const conn=await mongoose.connect("mongodb+srv://vrajsshah34:1111password@dormlink.adjunro.mongodb.net/?retryWrites=true&w=majority&appName=DormLink");
        console.log(`Connected to MongoDB Database ${conn.connection.host}`);
    }
    catch(error){
        console.log(`Error in MongoDB: ${error}`);
    }
};

export default connectDB;