import mongoose from "mongoose";

const sportSchema = new mongoose.Schema({
    name: {
        type: String,
        required : true,
        unique : true,
    },
    playersNo: {
        type : Number,
        required: true,
        default: 0,
    },

    playersEnrollNo: [{
        type: String
    }]
});

export default mongoose.model('sport',sportSchema);