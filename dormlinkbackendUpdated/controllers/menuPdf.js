// controllers/messMenuController.js

const MenuPdf = require('../models/menuPdf');

// Get menu by day and hostel
const getMenuPdf = async (req, res) => {
  try {
   
    const {hostel}= req.body;
    const menuLink = await MenuPdf.find({ hostel });
    if (!menuLink) {
      return res.status(404).send('Menu Link not found for this hostel');
    }
    res.status(201).json(menuLink);
  } catch (error) {
    console.error(error);
    res.status(500).send('Server Error');
  }
};

// Add a new menu entry
const addMenuPdf = async (req, res) => {
  try {
    const { link } = req.body;
    const { hostel} = req.params;
    const newMenu = new MenuPdf({
        hostel,
        link
    });
    await newMenu.save();
    res.status(201).send('Menu entry added successfully');
  } catch (error) {
    console.error(error);
    res.status(500).send('Server Error');
  }
};

module.exports = {
    getMenuPdf,
    addMenuPdf
};
