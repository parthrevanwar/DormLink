// routes/usersRoutes.js

const express = require('express');
const router = express.Router();
const usersController = require('../controllers/user');

// Get user details by ID
router.get('/', usersController.getUserById);

// Delete user by ID
router.delete('/', usersController.deleteUserById);

// Update user details by ID
router.put('/', usersController.updateUserById);

module.exports = router;
