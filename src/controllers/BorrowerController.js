let helper = require('../helper/index')
let BorrowerModels = require('../models/BorrowerModels')


module.exports = {
    GetAllBorrower: async function(request, response){
        try{
            let name_user = request.query.name_user == null ? '' : ' WHERE users.name_user = "'+request.query.name_user+'"'
            console.log(name_user)
            let result = await BorrowerModels.GetBorrowerModels(name_user)
            return helper.response(response, 'success', result, 201)
        }catch(error){
            console.log(error)
            return helper.response(response, 'failed', 'internal server error', 500)
        }
    },
    CreateBorrower: async function(request, response){
        try{
            let setData = {
                id_books: request.body.id_books,
                id_user: request.body.id_user,
                count: request.body.count,
                status: request.body.status
            }
            let result = await BorrowerModels.CreateBorrowerModels(setData)
            return helper.response(response, 'success', result, 201)
        }catch(error){
            console.log(error)
            return helper.response(response, 'failed', 'internal server error', 500)
        }
    },
    UpdateBorrower: async function(request, response){
        try{
            let id = request.params.id
            let setData = {
                id_books: request.body.id_books,
                id_user: request.body.id_user,
                count: request.body.count,
                status: request.body.status
            }
            let result = await BorrowerModels.UpdateBorrowerModels(id, setData)
            return helper.response(response, 'success', result, 201)

        }catch(error){
            console.log(error)
            return helper.response(response, 'failed', 'internal server error', 500)
        }
    },
    DeleteBorrower: async function(request, response){
        try{
            let id = request.params.id
            let result = await BorrowerModels.DeleteBorrowerModels(id)
        return helper.response(response, 'success', result, 201)
        }catch(error){
            console.log(error)
            return helper.response(response, 'failed', 'internal server error', 500)
        }
    }
}
