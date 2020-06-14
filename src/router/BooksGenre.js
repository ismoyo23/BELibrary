let express = require('express')
let router = express.Router()
let GenreController = require('../controllers/GenreController')
let AuthMidleware = require('../midleware/auth')

router.get('/',AuthMidleware.verifyLibrarianToken, GenreController.GetAllGenre)
router.post('/',AuthMidleware.verifyLibrarianToken, GenreController.CreateGenre)
router.put('/:id',AuthMidleware.verifyLibrarianToken, GenreController.UpdateGenre)
router.delete('/:id',AuthMidleware.verifyLibrarianToken, GenreController.DeleteGenre)

module.exports = router