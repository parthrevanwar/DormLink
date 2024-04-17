// import mongoose from "mongoose";

const mongoose = require("mongoose");

const ticketSchema=new mongoose.Schema({
    enrollmentNo:{
        type:String,
        required:true
    },
    name:{
        type:String,
        required:true
    },
    title:{
        type:String,
        required:true
    },
    description:{
        type:String,
        required:true
    },
    roomNo:{
        type:String,
        
    },
    status:{
        type:Number,
        default:0
    }
},)

module.exports = mongoose.model('ticket',ticketSchema)
