const mongoose = require("mongoose");


const slotSchema = new mongoose.Schema({
    startTime: {
        type : Date,
        required: true,
    },
    bookedBy: {
        type: String, //enrollmentNo
        // ref: 'User',
        default: null
    }
})

const washingMachineSchema = new mongoose.Schema({
    machineNumber:{
        type:Number,
        required:true,
        unique: true
    },
    location:{
        type:String,
        required:true
    },
    floor:{
        type:Number,
        required:true
    },
    slots:{
        type: [String],
    default: Array.from({ length: 24 }, () => null)
    }


});

// function    () {
//     const slots = [];
//     const currentTime = new Date();
  
//     for (let i = 0; i < 24; i++) {
//       const startTime = new Date(currentTime);
//       startTime.setHours(startTime.getHours() + i);
//       slots.push({ startTime });
//     }
  
//     return slots;
// };


const WashingMachine = mongoose.model('WashingMachine', washingMachineSchema);

module.exports = WashingMachine;