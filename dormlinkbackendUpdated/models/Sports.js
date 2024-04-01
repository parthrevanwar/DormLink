// models/Sport.js

const mongoose = require('mongoose');

const sportSchema = new mongoose.Schema({
  sportname: {
    type: String,
    required: true
  },
  numberOfPlayers: {
    type: Number,
    required: true
  },
  players: [{
    enrollmentNo: {
      type: String,
      required: true
    },
    name: {
      type: String,
      required: true
    }
  }]
});

module.exports = mongoose.model('Sport', sportSchema);
