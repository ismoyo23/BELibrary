let multer = require('multer');

let storage = multer.diskStorage({
    destination: function(req, file, cb) {
        cb(null, './src/upload');
     },
    filename: function (req, file, cb) {
        cb(null , file.originalname);
    }
});

// function file size for image
let upload = multer({ storage: storage })

module.exports = upload