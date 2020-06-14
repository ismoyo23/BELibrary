let express = require('express')
let router = express.Router()
let BooksController = require('../controllers/BooksController')
let upload = require('../multer/settings')
let AuthMidleware = require('../midleware/auth')

router.get('/', AuthMidleware.verifyLibrarianToken, BooksController.GetAllBooks)
router.post('/', AuthMidleware.verifyLibrarianToken, upload.single('image'), BooksController.CreateBooks)
router.put('/:id', AuthMidleware.verifyLibrarianToken, upload.single('image'), BooksController.UpdateBooks)
router.delete('/:id', AuthMidleware.verifyJwtToken, BooksController.DeleteBooks)

module.exports = router