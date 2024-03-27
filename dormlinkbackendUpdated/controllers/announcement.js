// controllers/announcementController.js

const Announcement = require('../models/Announcement');

// Create Announcement
exports.createAnnouncement = async (req, res) => {
  try {
    const { title, content, createdBy } = req.body;
    const announcement = new Announcement({ title, content, createdBy });
    await announcement.save();
    res.status(201).json(announcement);
  } catch (error) {
    console.error(error);
    res.status(500).send('Server Error');
  }
};

// Get All Announcements
exports.getAllAnnouncements = async (req, res) => {
  try {
    const announcements = await Announcement.find().populate('createdBy', 'name email');
    res.json(announcements);
  } catch (error) {
    console.error(error);
    res.status(500).send('Server Error');
  }
};

// Get Announcement by ID
exports.getAnnouncementById = async (req, res) => {
  try {
    const announcement = await Announcement.findById(req.params.announcementId).populate('createdBy', 'name email');
    if (!announcement) {
      return res.status(404).send('Announcement not found');
    }
    res.json(announcement);
  } catch (error) {
    console.error(error);
    res.status(500).send('Server Error');
  }
};

// Update Announcement
exports.updateAnnouncement = async (req, res) => {
  try {
    const { title, content } = req.body;
    const updatedAnnouncement = await Announcement.findByIdAndUpdate(req.params.announcementId, { title, content }, { new: true });
    if (!updatedAnnouncement) {
      return res.status(404).send('Announcement not found');
    }
    res.json(updatedAnnouncement);
  } catch (error) {
    console.error(error);
    res.status(500).send('Server Error');
  }
};

// Delete Announcement
exports.deleteAnnouncement = async (req, res) => {
  try {
    const deletedAnnouncement = await Announcement.findByIdAndDelete(req.params.announcementId);
    if (!deletedAnnouncement) {
      return res.status(404).send('Announcement not found');
    }
    res.send('Announcement deleted successfully');
  } catch (error) {
    console.error(error);
    res.status(500).send('Server Error');
  }
};
