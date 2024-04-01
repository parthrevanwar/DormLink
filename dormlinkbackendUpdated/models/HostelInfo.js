// hostelInfoModel.js

const mongoose = require('mongoose');
const Schema = mongoose.Schema;

// Define schema for hostel information
const hostelInfoSchema = new Schema({
  enrollmentNo: { type: String, required: true, unique: true },
  hostel: { type: String, required: true },
  isAdmin: { type: Boolean, default: false }
});

// Create a model for hostel information
const HostelInfo = mongoose.model('HostelInfo', hostelInfoSchema);

module.exports = HostelInfo;
