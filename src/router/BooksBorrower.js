let express = require('express')
let router = express.Router()
let BorrowerController = require('../controllers/BorrowerController')
let AuthMidleware = require('../midleware/Auth')

router.get('/', BorrowerController.GetAllBorrower)
router.post('/', BorrowerController.CreateBorrower)
router.put('/:id',AuthMidleware.verifyJwtToken, BorrowerController.UpdateBorrower)
router.delete('/:id', BorrowerController.DeleteBorrower)

module.exports = router