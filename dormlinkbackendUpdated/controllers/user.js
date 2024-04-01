// controllers/usersController.js

const User = require('../models/User');

// Get user details by ID
const getUserById = async (req, res) => {
  try {
    const user = await User.findById(req.userId);
    if (!user) {
      return res.status(404).send('User not found');
    }
    res.json(user);
  } catch (error) {
    console.error(error);
    res.status(500).send('Server Error');
  }
};

// Delete user by ID
const deleteUserById = async (req, res) => {
  try {
    const user = await User.findByIdAndDelete(req.userId);
    if (!user) {
      return res.status(404).send('User not found');
    }
    res.send('User deleted successfully');
  } catch (error) {
    console.error(error);
    res.status(500).send('Server Error');
  }
};

// Update user details by ID
const updateUserById = async (req, res) => {
  res.send("under development");
  try {
    const { newname, newenrollmentNo, newemail, newpassword } = req.body;
    console.log(req.body);
    const updatedUser = await User.findByIdAndUpdate(req.userId, {
      newname,
      newenrollmentNo,
      newemail,
      newpassword
    }, { new: true });
    if (!updatedUser) {
      return res.status(404).send('User not found');
    }
    console.log(updatedUser);
    res.json(updatedUser);
  } catch (error) {
    console.error(error);
    res.status(500).send('Server Error');
  }
};

module.exports = {
  getUserById,
  deleteUserById,
  updateUserById
};
