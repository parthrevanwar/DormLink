const WashingMachine = require('../models/WashingMachine');


exports.getAllMachines = async (req, res) => {
    try {

      const {hostel} = req.body;



      const machines = await WashingMachine.find({location: hostel});
       // Extract machine numbers from the query result
      //  const machineNumbers = machines.map(machine => machine.machineNumber.toString());

       // Return machine numbers as strings in the response
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

  exports.addNewMachine = async (req,res) => {

    try{
    const {machineNumber , location, floor } = req.body;

    if (!machineNumber)
            return res.status(500).send({error:"Machine number is required"});
    if (!location)
        return res.status(500).send({error:"location is required"});
    if( !floor)
        return res.status(500).send({error:"Floor is required"});
    // if(floor !== "Ground" || floor !== "First" || floor !== "Second" || floor !== "Third" ){
    //   return res.status(500).send({error:"Floor should be one of either Ground, First or Second"}); 
    // }


    const newMachine = await new WashingMachine({
      machineNumber,
      location,
      floor
    });

    await newMachine.save();

    res.status(201).send({
      success:true,
      message:'Machine Added',
      newMachine
  })
  }
  catch (error) {
    console.log(error);
    res.status(500).send({
        success: false,
        error,
        message: "Error in Machine Creation"
    });
}
        
      
}; 