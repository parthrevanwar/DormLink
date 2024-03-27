// routes/auth.js

const express = require('express');
const router = express.Router();
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const User = require('../models/User');

// User registration
router.post('/register', async (req, res) => {
  try {
    const { name, enrollmentNo, email, password } = req.body;
    // Hash the password
    const hashedPassword = await bcrypt.hash(password, 10);
    // Create a new user
    const user = new User({ name, enrollmentNo, email, password: hashedPassword });
    // Save the user to the database
    await user.save();
    res.status(201).send('User registered successfully');
  } catch (error) {
    console.error(error);
    res.status(500).send('An error occurred while registering the user');
  }
});

// User login
router.post('/login', async (req, res) => {
  try {
    const { enrollmentNo, password } = req.body;
    // Find the user by enrollment number
    const user = await User.findOne({ enrollmentNo });
    if (!user) {
      return res.status(400).send('Invalid enrollment number or password');
    }
    // Compare passwords
    const validPassword = await bcrypt.compare(password, user.password);
    if (!validPassword) {
      return res.status(400).send('Invalid enrollment number or password');
    }
    // Generate a JWT token
    const token = jwt.sign({ userId: user._id }, 'your-secret-key');
    res.send({ token });
  } catch (error) {
    console.error(error);
    res.status(500).send('An error occurred while logging in');
  }
});

module.exports = router;
