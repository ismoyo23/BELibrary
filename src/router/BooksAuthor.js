let express = require('express')
let router = express.Router()
let AuthorController = require('../controllers/AuthorController')
let AuthMidleware = require('../midleware/auth')

router.get('/',AuthMidleware.verifyLibrarianToken, AuthorController.GetAllAuthor)
router.post('/',AuthMidleware.verifyLibrarianToken, AuthorController.CreateAuthor)
router.put('/:id',AuthMidleware.verifyLibrarianToken, AuthorController.UpdateAuthor)
router.delete('/:id',AuthMidleware.verifyLibrarianToken, AuthorController.DeleteAuthor)

module.exports = router