let helper = require('../helper/index')
let AuthModels = require('../models/AuthModels')
let PasswordHash = require('password-hash')
let jwt = require('jsonwebtoken')
let config = require('../config/global')

module.exports = {
    Register: async function(request, response){
        let setData = {
            name_user: request.body.name_user,
            email: request.body.email,
            password: PasswordHash.generate(request.body.password),
            address: request.body.address,
            role: request.body.role
        }
        try{
            let result = await AuthModels.AuthRegister(setData)
            return helper.response(response, 'success', result, 201)
        }catch(error){
            console.log(error)
            return helper.response(response, 'failed', 'internal server error', 500)
        }
    },

    Login: async function(request, response){
        let setData = {
            name_user: request.body.name_user,
            password: request.body.password
        }
        try{
            let result = await AuthModels.AuthLogin(setData)
            let hashedPassword = result[0].password
            let VerifyPassword = PasswordHash.verify(setData.password, hashedPassword)
        if(VerifyPassword){
            delete result[0].password
            let tokenData = {
                ...result[0]
        }
        if(result[0].role == 0){
            // role 0 is user
            let AccessToken = jwt.sign(tokenData, config.jwtSecretKey, { expiresIn: '2d' })
            result[0].AccessTokenUser = AccessToken

            let RefreshToken = jwt.sign(tokenData, config.jwtSecretKey, { expiresIn: '4d' })
            result[0].RefreshTokenUser = RefreshToken
        }else{
            // role 1 librarian
            let AccessToken = jwt.sign(tokenData, config.jwtLibrarianKey, { expiresIn: '2d' })
            result[0].AccessTokenLibrarian = AccessToken

            let RefreshToken = jwt.sign(tokenData, config.jwtLibrarianKey, { expiresIn: '4d' })
            result[0].RefreshTokenLibrarian = RefreshToken

            let AccessTokenUser = jwt.sign(tokenData, config.jwtSecretKey, { expiresIn: '2d' })
            result[0].AccessTokenUser = AccessTokenUser

            let RefreshTokenUser = jwt.sign(tokenData, config.jwtSecretKey, { expiresIn: '4d' })
            result[0].RefreshTokenUser = RefreshTokenUser
        }

            return helper.response(response, 'success', result, 201)
        }else{
            return helper.response(response, 'failed', 'Username or password wrong', 201)
        }
        // if there is no token
        // return an error
        }catch(error){
            console.log(error)
            return helper.response(response, 'failed', 'internal server error', 500)
        }
        
    }
}