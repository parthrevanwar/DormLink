// middleware/authenticate.js

const jwt = require('jsonwebtoken');

// const authenticateToken = (req, res, next) => {
//   const token = req.headers['authorization'];
//   if (!token) return res.status(401).send('Access denied. No token provided.');

//   jwt.verify(token, 'your-secret-key', (err, decoded) => {
//     if (err) return res.status(403).send('Invalid token.');

//     req.userId = decoded.userId;
//     next();
//   });
// };

const authenticateToken = (req, res, next) => {
  const token = req.headers['authorization'];
  if (!token) return res.status(401).send('Access denied. No token provided.');

  jwt.verify(token, 'your-secret-key', (err, decoded) => {
    if (err) return res.status(403).send('Invalid token.');

    // Extract enrollment number and isAdmin from the decoded token payload
    const { userId, enrollmentNo, hostel, isAdmin } = decoded;

    // Add enrollment number and isAdmin to the request body
    req.userId = userId;
    req.body.enrollmentNo = enrollmentNo;
    req.body.hostel = hostel;
    req.body.isAdmin = isAdmin;

    next();
  });
};

module.exports = authenticateToken;
