const express = require('express');
const router = express.Router();
const messAttendanceController = require('../controllers/messattendence');
const checkadmin=require('../middleware/checkadmin');

// POST request to add mess attendance
router.post('/',checkadmin, messAttendanceController.addAttendance);

// GET request to view mess attendance by ID
router.get('/', messAttendanceController.getAttendanceById);

// GET request to view mess attendance by enrollment number
router.get('/enrollmentNo/:enrollmentNo',checkadmin, messAttendanceController.getAttendanceByEnrollmentNo);

module.exports = router;
