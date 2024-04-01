// routes/messMenuRoutes.js

const express = require('express');
const router = express.Router();
const messMenuController = require('../controllers/messmenu');

// Get menu by day and hostel
router.get('/:day/:hostel', messMenuController.getMenuByDayAndHostel);

// Add a new menu entry
router.post('/add', messMenuController.addMenuEntry);

// Update menu entry by day and hostel
router.put('/:day/:hostel', messMenuController.updateMenuEntry);

// Delete menu entry by day and hostel
router.delete('/:day/:hostel', messMenuController.deleteMenuEntry);

module.exports = router;
