const Hostelinfo = require('../models/HostelInfo');


const addstudent = async (req,res)=>{
    try {
        const { enrollmentNo, hostel,isAdmin, roomNo } = req.body;
        if (!enrollmentNo)
            return res.status(500).send({error:"enrollmentNo is required"});
        if (!hostel)
            return res.status(500).send({error:"hostel is required"});
        if( !isAdmin)
            return res.status(500).send({error:"isAdmin is required"});
        if (!roomNo)
            return res.status(500).send({error:"roomNo is required"}); 

        const newstudent= new Hostelinfo( { enrollmentNo, hostel,isAdmin, roomNo });

        await newstudent.save();
        res.status(201).json(newstudent);
    } catch (err) {
        console.error(error);
        res.status(500).send('Server Error');
    }
}

module.exports ={addstudent};