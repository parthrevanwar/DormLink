const mongoose = require('mongoose');

const messAttendanceSchema = new mongoose.Schema({
  date: {
    type: Date,
    required: true
  },
  mealType: {
    type: String,
    enum: ['breakfast', 'lunch', 'dinner'],
    required: true
  },
  enrollmentNo: {
    type: String,
    required: true
  }
});

module.exports = mongoose.model('MessAttendance', messAttendanceSchema);
