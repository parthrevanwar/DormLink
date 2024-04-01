const checkAdmin = (req, res, next) => {
    // Check if isAdmin parameter exists in the request body
    if (!req.body.isAdmin) {
      return res.status(403).send('Forbidden: User is not an admin');
    }
  
    // Check if isAdmin is true
    if (req.body.isAdmin !== true) {
      return res.status(403).send('Forbidden: User is not an admin');
    }
  
    // If isAdmin is true, proceed to the next middleware
    next();
  };
  
  module.exports = checkAdmin;