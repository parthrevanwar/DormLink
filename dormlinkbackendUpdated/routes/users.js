// routes/users.js

const express = require('express');
const router = express.Router();
const User = require('../models/User');

// Get user details by ID
router.get('/:userId', async (req, res) => {
  try {
    const user = await User.findById(req.params.userId);
    if (!user) {
      return res.status(404).send('User not found');
    }
    res.json(user);
  } catch (error) {
    console.error(error);
    res.status(500).send('Server Error');
  }
});

// Delete user by ID
router.delete('/:userId', async (req, res) => {
    try {
      const user = await User.findByIdAndDelete(req.params.userId);
      if (!user) {
        return res.status(404).send('User not found');
      }
      res.send('User deleted successfully');
    } catch (error) {
      console.error(error);
      res.status(500).send('Server Error');
    }
  });

// Update user details by ID
router.put('/:userId', async (req, res) => {
  try {
    const { name, enrollmentNo, email, password } = req.body;
    const updatedUser = await User.findByIdAndUpdate(req.params.userId, {
      name,
      enrollmentNo,
      email,
      password
    }, { new: true });
    if (!updatedUser) {
      return res.status(404).send('User not found');
    }
    res.json(updatedUser);
  } catch (error) {
    console.error(error);
    res.status(500).send('Server Error');
  }
});


module.exports = router;
