// routes/announcementRoutes.js

const express = require('express');
const router = express.Router();
const announcementController = require('../controllers/announcement');
const checkadmin=require('../middleware/checkadmin');

// Create Announcement
router.post('/',checkadmin, announcementController.createAnnouncement);

// Get All Announcements
router.get('/', announcementController.getAllAnnouncements);

// Get Announcement by ID
router.get('/:announcementId', announcementController.getAnnouncementById);

// Update Announcement
router.put('/:announcementId',checkadmin, announcementController.updateAnnouncement);

// Delete Announcement
router.delete('/:announcementId',checkadmin, announcementController.deleteAnnouncement);

module.exports = router;
