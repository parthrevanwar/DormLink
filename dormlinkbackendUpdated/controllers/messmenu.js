// controllers/messMenuController.js

const MessMenu = require('../models/MessMenu');

// Get menu by day and hostel
const getMenuByDayAndHostel = async (req, res) => {
  try {
    const { day, hostel } = req.params;
    const menu = await MessMenu.findOne({ day, hostels: hostel });
    if (!menu) {
      return res.status(404).send('Menu not found for this day and hostel');
    }
    res.json(menu);
  } catch (error) {
    console.error(error);
    res.status(500).send('Server Error');
  }
};

// Add a new menu entry
const addMenuEntry = async (req, res) => {
  try {
    const { day, breakfast, lunch, dinner, hostels } = req.body;
    const existingMenu = await MessMenu.findOne({ day, hostels: { $in: hostels } });
    if (existingMenu) {
      return res.status(400).send('Menu entry already exists for this day and hostel');
    }
    const newMenu = new MessMenu({
      day,
      breakfast,
      lunch,
      dinner,
      hostels
    });
    await newMenu.save();
    res.status(201).send('Menu entry added successfully');
  } catch (error) {
    console.error(error);
    res.status(500).send('Server Error');
  }
};

// Update menu entry by day and hostel
const updateMenuEntry = async (req, res) => {
  try {
    const { day, hostel } = req.params;
    const { breakfast, lunch, dinner } = req.body;
    const updatedMenu = await MessMenu.findOneAndUpdate(
      { day, hostels: hostel },
      { $set: { breakfast, lunch, dinner } },
      { new: true }
    );
    if (!updatedMenu) {
      return res.status(404).send('Menu entry not found');
    }
    res.json(updatedMenu);
  } catch (error) {
    console.error(error);
    res.status(500).send('Server Error');
  }
};

// Delete menu entry by day and hostel
const deleteMenuEntry = async (req, res) => {
  try {
    const { day, hostel } = req.params;
    const deletedMenu = await MessMenu.findOneAndDelete({ day, hostels: hostel });
    if (!deletedMenu) {
      return res.status(404).send('Menu entry not found');
    }
    res.send('Menu entry deleted successfully');
  } catch (error) {
    console.error(error);
    res.status(500).send('Server Error');
  }
};

module.exports = {
  getMenuByDayAndHostel,
  addMenuEntry,
  updateMenuEntry,
  deleteMenuEntry
};
