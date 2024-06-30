
const express = require('express');
const router = express.Router();
const addstudentController = require('../controllers/addstudentcontroller');
const checkadmin=require('../middleware/checkadmin');

router.post('/', addstudentController.addstudent);

module.exports = router;
