const express = require('express');
const router = express.Router();
const washingMachineController = require('../controllers/washingMachine');
const { get } = require('mongoose');

router.get('/list-washing-machines', washingMachineController.getAllMachines);

router.post('/:machineId/book', washingMachineController.bookMachineSlot);

router.get('/:machineId/slots', washingMachineController.getMachineSlotsStatus);

router.post('/add-washing-machine', washingMachineController.addNewMachine);

module.exports = router;