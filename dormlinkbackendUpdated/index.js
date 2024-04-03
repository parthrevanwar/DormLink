// app.js

const express = require('express');
const mongoose = require('mongoose');
const authRoutes = require('./routes/auth');
const protectedRoute = require('./routes/protectedRoute');
const usersRoutes = require('./routes/users');
const announcementRoutes = require('./routes/announcement');
const sportRoutes = require('./routes/sports');
const authenticateToken = require('./middleware/authenticate');
const messMenuRoutes=require('./routes/messmenu');
const connectDB = require('./config/db.js');

const app = express();

// Middleware
app.use(express.json());

connectDB();

// Connect to MongoDB
// mongoose.connect('mongodb://127.0.0.1:27017/dormlink')
//   .then(() => console.log('Connected to MongoDB'))
//   .catch(err => console.error('Error connecting to MongoDB:', err));

// Routes
app.use('/auth', authRoutes); //done
app.use('/',authenticateToken, protectedRoute);//testing only no use of this route 
app.use('/users',authenticateToken, usersRoutes);//done
app.use('/announcements',authenticateToken, announcementRoutes); //done 
app.use('/sports',authenticateToken, sportRoutes); //done
app.use('/messmenu',authenticateToken, messMenuRoutes);//done


// Start the server
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`Server started on port ${PORT}`));
