let express = require('express')
let router = express.Router()
let BooksController = require('../controllers/BooksController')
let upload = require('../multer/settings')
let AuthMidleware = require('../midleware/Auth')

router.get('/', BooksController.GetAllBooks)
router.post('/', upload.single('image'), BooksController.CreateBooks)
router.put('/:id',  upload.single('image'), BooksController.UpdateBooks)
router.delete('/:id', BooksController.DeleteBooks)

module.exports = router

// AuthMidleware.LibrarianKey