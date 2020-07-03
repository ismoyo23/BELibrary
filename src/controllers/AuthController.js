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
            result[0].AccessToken = AccessToken
            
        }else{
            // role 1 is Librarian
            let AccessToken = jwt.sign(tokenData, config.jwtSecretKey, { expiresIn: '2d' })
            result[0].AccessToken = AccessToken
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
        
    },

    RefreshToken: (request, response)=>{
        let verify = request.headers.authorization
        const decoded = jwt.verify(verify, config.jwtSecretKey);
        delete decoded.exp
        delete decoded.iat
            let tokenData = {
                ...decoded
        }
        let AccessToken = jwt.sign(tokenData, config.jwtSecretKey, { expiresIn: '5d' })
        decoded.RefreshToken = AccessToken

        return helper.response(response, 'success', decoded, 201)
    }
}