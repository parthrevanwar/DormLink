const WashingMachine = require('../models/WashingMachine');

exports.getAllMachines = async (req, res) => {
    try {
      const machines = await WashingMachine.find();
      res.json(machines);
    } catch (err) {
      res.status(500).json({ message: err.message });
    }
};
// Book a slot for a washing machine
exports.bookMachineSlot = async (req, res) => {
    const machineId = req.params.machineId;
    const { enrollmentNo, slotIndex } = req.body;
  
    try {
      const machine = await WashingMachine.findById(machineId);
  
      if (!machine) {
        return res.status(404).json({ message: 'Machine not found' });
      }
  
      // Check if the slot is already booked
      if (machine.slots[slotIndex] !== null) {
        return res.status(400).json({ message: 'Slot already booked' });
      }
  
      // Book the slot
      machine.slots[slotIndex] = enrollmentNo;
      await machine.save();
  
      res.json({success:true, message: 'Slot booked successfully', machine });
    } catch (err) {
      res.status(500).json({ message: err.message });
    }
  };
  
  // Get status of all slots for a washing machine
  exports.getMachineSlotsStatus = async (req, res) => {
    const machineId = req.params.machineId;
  
    try {
      const machine = await WashingMachine.findById(machineId);
  
      if (!machine) {
        return res.status(404).json({ message: 'Machine not found' });
      }
  
      res.json({ slots: machine.slots });
    } catch (err) {
      res.status(500).json({ message: err.message });
    }
  };