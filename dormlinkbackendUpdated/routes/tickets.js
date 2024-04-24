
// import formidable from "express-formidable";
// import { createTicketController, deleteTicketController, getClosedTicketController, getOpenTicketController, updateTicketController } from "../controllers/ticketController.js";
const express = require('express');
const {createTicketController,deleteTicketController,getClosedTicketController,getOpenTicketController,updateTicketController, updateTicketStatusController} = require("../controllers/tickets.js")

//router object
const router = express.Router();


//router

router.post('/create-ticket', createTicketController);
router.post('/update-ticket/:pid', updateTicketController);
router.get('/get-op-ticket',getOpenTicketController);
router.get('/get-cl-ticket',getClosedTicketController);
router.get('/delete-ticket/:pid',deleteTicketController);
router.put('/update-ticket-status/:id' , updateTicketStatusController);

module.exports = router;