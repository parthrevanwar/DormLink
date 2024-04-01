// models/MessMenu.js

const mongoose = require('mongoose');

const messMenuSchema = new mongoose.Schema({
  day: {
    type: String,
    required: true
  },
  breakfast: {
    type: String,
    required: true
  },
  lunch: {
    type: String,
    required: true
  },
  dinner: {
    type: String,
    required: true
  },
  hostels: [{
    type: String,
    required: true
  }]
});

const MessMenu = mongoose.model('MessMenu', messMenuSchema);

module.exports = MessMenu;
