const mongoose = require('mongoose');

const menuPdfSchema = new mongoose.Schema({
    link: {
        type: String,
        required: true
    },
    hostel: {
        type: String,
        required: true
    }
});

const MenuPdf = mongoose.model('MenuPdf', menuPdfSchema);

module.exports = MenuPdf;