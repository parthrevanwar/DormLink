// routes/sportRoutes.js

const express = require('express');
const router = express.Router();
const sportController = require('../controllers/sports');
const checkadmin=require('../middleware/checkadmin');

// Add a new sport
router.post('/add',checkadmin, sportController.addSport);

// Add a player to a sport
router.post('/addPlayer/:sportname', sportController.addPlayerToSport);

// Get all players currently playing for a specific sport
router.get('/playing/:sportname', sportController.getPlayersInSport);

// Remove oneself from a sport
router.delete('/removePlayer/:sportname', sportController.removePlayerFromSport);

module.exports = router;
