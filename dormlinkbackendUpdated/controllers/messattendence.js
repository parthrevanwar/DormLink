const MessAttendance = require('../models/Messattendence');
const User = require('../models/User');

exports.addAttendance = async (req, res) => {
  try {
    const { date, mealType, attendees } = req.body;
    // const user = await User.findById(attendees);
    // const enrollmentNo =user.enrollmentNo;
    const attendance = new MessAttendance({ date, mealType, enrollmentNo: attendees });
    await attendance.save();
    res.status(201).json({status :"success"});
  } catch (error) {
    console.error(error);
    res.status(500).send('Server Error');
  }
};

//for user 
exports.getAttendanceById = async (req, res) => {
  try {
    const { enrollmentNo } = req.body;
    const attendance = await MessAttendance.find({enrollmentNo});
    if (!attendance) {
      return res.status(404).send('Attendance not found');
    }
    res.json(attendance);
  } catch (error) {
    console.error(error);
    res.status(500).send('Server Error');
  }
};

//for admin
exports.getAttendanceByEnrollmentNo = async (req, res) => {
  try {
    const { enrollmentNo } = req.params;
    
    // Find attendance records based on enrollment number
    const attendance = await MessAttendance.find({ enrollmentNo });

    if (!attendance || attendance.length === 0) {
      return res.status(404).send('Attendance not found');
    }

    res.json(attendance);
  } catch (error) {
    console.error(error);
    res.status(500).send('Server Error');
  }
};