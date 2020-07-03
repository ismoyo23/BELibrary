let express = require('express')
let router = express.Router()
let AuthUser = require('../controllers/AuthController')

router.post('/register', AuthUser.Register)
router.post('/login', AuthUser.Login)
router.post('/refreshtoken', AuthUser.RefreshToken)

module.exports = router
