// routes/protectedRoute.js

const express = require('express');
const router = express.Router();
const authenticateToken = require('../middleware/authenticate');

router.get('/protected', authenticateToken, function(req, res){
  // Access the user ID via req.userId
  res.send(req.body);
});

module.exports = router;
