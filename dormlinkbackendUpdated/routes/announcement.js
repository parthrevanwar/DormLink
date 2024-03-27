// routes/announcementRoutes.js

const express = require('express');
const router = express.Router();
const announcementController = require('../controllers/announcement');

// Create Announcement
router.post('/', announcementController.createAnnouncement);

// Get All Announcements
router.get('/', announcementController.getAllAnnouncements);

// Get Announcement by ID
router.get('/:announcementId', announcementController.getAnnouncementById);

// Update Announcement
router.put('/:announcementId', announcementController.updateAnnouncement);

// Delete Announcement
router.delete('/:announcementId', announcementController.deleteAnnouncement);

module.exports = router;
