// routes/messMenuRoutes.js

const express = require('express');
const router = express.Router();
const  menuPdfController= require('../controllers/menuPdf');
const checkadmin=require('../middleware/checkadmin');

// Get menu by day and hostel
router.get('/', menuPdfController.getMenuPdf);

// Add a new menu entry
router.post('/:hostel',checkadmin, menuPdfController.addMenuPdf);


module.exports = router;
