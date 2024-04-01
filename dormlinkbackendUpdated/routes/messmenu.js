// routes/messMenuRoutes.js

const express = require('express');
const router = express.Router();
const messMenuController = require('../controllers/messmenu');
const checkadmin=require('../middleware/checkadmin');

// Get menu by day and hostel
router.get('/:day', messMenuController.getMenuByDayAndHostel);

// Add a new menu entry
router.post('/add',checkadmin, messMenuController.addMenuEntry);

// Update menu entry by day and hostel
router.put('/:day/:hostel',checkadmin, messMenuController.updateMenuEntry);

// Delete menu entry by day and hostel
router.delete('/:day/:hostel',checkadmin, messMenuController.deleteMenuEntry);

module.exports = router;
