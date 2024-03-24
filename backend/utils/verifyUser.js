import jwt from "jsonwebtoken";
import {errorHandler} from "./error.js";

export const verifyToken = (req,res,next) => {
    const token = req.cookies.access_token;

    if(!token){
        return next(errorHandler(401,'Unauthorized'));
    }

    jwt.verify(token,"eoggy776g7",(err,user) => {
        if(err) return next(403, "Forbidden (Error in verifying user by jwt)");
        
        req.user = user;
        next();

    });
};