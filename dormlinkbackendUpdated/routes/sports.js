// routes/sportRoutes.js

const express = require('express');
const router = express.Router();
const sportController = require('../controllers/sports');

// Add a new sport
router.post('/add', sportController.addSport);

// Add a player to a sport
router.post('/addPlayer', sportController.addPlayerToSport);

// Get all players currently playing for a specific sport
router.get('/playing/:sportName', sportController.getPlayersInSport);

// Remove oneself from a sport
router.delete('/removePlayer/:sportName', sportController.removePlayerFromSport);

module.exports = router;
