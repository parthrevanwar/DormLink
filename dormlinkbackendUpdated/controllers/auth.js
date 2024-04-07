// controllers/authController.js

const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const User = require('../models/User');
const HostelInfo = require('../models/HostelInfo');

// User registration
const registerUser = async (req, res) => {
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
};

// User login
// const loginUser = async (req, res) => {
//   try {
//     const { enrollmentNo, password } = req.body;
//     // Find the user by enrollment number
//     const user = await User.findOne({ enrollmentNo });
//     if (!user) {
//       return res.status(400).send('Invalid enrollment number or password');
//     }
//     // Compare passwords
//     const validPassword = await bcrypt.compare(password, user.password);
//     if (!validPassword) {
//       return res.status(400).send('Invalid enrollment number or password');
//     }
//     // Generate a JWT token
//     const token = jwt.sign({ userId: user._id }, 'your-secret-key');
//     res.send({ token });
//   } catch (error) {
//     console.error(error);
//     res.status(500).send('An error occurred while logging in');
//   }
// };

const loginUser = async (req, res) => {
  try {
    const { enrollmentNo, password } = req.body;
    // Find the user by enrollment number
    const user = await User.findOne({ enrollmentNo: enrollmentNo });
    if (!user) {
      return res.status(400).send('Invalid enrollment number or password');
    }
    // Compare passwords
    const validPassword = await bcrypt.compare(password, user.password);
    if (!validPassword) {
      return res.status(400).send('Invalid enrollment number or password');
    }
    // Query hostel_info collection to get hostel and isAdmin status
    const hostelInfo = await HostelInfo.findOne({ enrollmentNo: enrollmentNo });
    if (!hostelInfo) {
      console.log(hostelInfo);
      return res.status(400).send('Invalid enrollment number123');
    }
    console.log(hostelInfo);
    // Generate a JWT token including enrollment number, hostel, and isAdmin status
    const tokenPayload = {
      userId: user._id,
      enrollmentNo: user.enrollmentNo,
      name: user.name,
      hostel: hostelInfo.hostel,
      isAdmin: hostelInfo.isAdmin
    };

    const expiresIn = 3600000000;
    const token = jwt.sign(tokenPayload, 'your-secret-key', {expiresIn});
    // Return enrollment number, hostel, isAdmin status, and token
    res.send({ 
      enrollmentNo: user.enrollmentNo, 
      hostel: hostelInfo.hostel, 
      name:user.name,
      isAdmin: hostelInfo.isAdmin, 
      token 
    });
  } catch (error) {
    console.error(error);
    res.status(500).send('An error occurred while logging in');
  }
};

module.exports = {
  registerUser,
  loginUser
};
