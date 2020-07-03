let helper = require('../helper/index')
let BooksModels = require('../models/BooksModels')
let fs = require('fs')
module.exports = {
    GetAllBooks: async function(request, response){
            try{
                // conditions for paginations, search, sort
                let param = {
                    byfield: request.query.search == null ? '' : 'WHERE '+request.query.field+' LIKE "%'+request.query.search+'%"',
                    sort: request.query.sort == null ? '' : ' ORDER BY book_detail.id '+request.query.sort,
                    page: request.query.page == null ? '' : ' LIMIT '+request.query.page
                }
                
                let result = await BooksModels.AllBooksModel(param);
            
                 return helper.response(response, 'success', result, 201)
               
                
            }catch(error){
                console.log(error)
                return helper.response(response, 'fail', 'Internal Server Error', 500)
            }
      
    },

    CreateBooks: async function(request, response){
        let setData = {
            title: request.body.title,
            discription: request.body.discription,
            image: request.file.path,
            stok: request.body.stok,
            id_genre: request.body.id_genre,
            id_author: request.body.id_author
        }
        try{
            console.log(request.file)
            let result = await BooksModels.CreateBooksModel(setData)
            return helper.response(response, 'success', result, 201)
        }catch(error){
            console.log(error)
            return helper.response(response, 'failed', 'internal serve error', 500)
        }
    },

        UpdateBooks: async function(request, response){
            let setData = {
                title: request.body.title,
                discription: request.body.discription,
                image: request.file.path,
                stok: request.body.stok,
                id_genre: request.body.id_genre,
                status: request.body.status,
                id_author: request.body.id_author   
            }
            let id = request.params.id
            try{
                let PathImage = await BooksModels.GetBooksById(id)
                // fs unlink for delete image on storage
                fs.unlink(PathImage[0].image, async function (err) {
                let result = await BooksModels.UpdateBooksModel(setData, id)
            
                return helper.response(response, 'success', result, 201)
                });  
            }catch(error){
                console.log(error)
                return helper.response(response, 'failed', 'internal server error', 500)
            }
            
        },

        DeleteBooks: async function(request, response){
            try{
                let id = request.params.id
                let PathImage = await BooksModels.GetBooksById(id)
                // fs unlink for delete image on storage
                fs.unlink(PathImage[0].image, async function (err) {
                    let result = await BooksModels.DeleteBooksModels(id)
                    return helper.response(response, 'success', 'success delete id =' + id, 201)
                })
            }catch(error){
                console.log(RangeError)
                return helper.response(response, 'failed', 'internal server error', 500)
            }
            
        }

    }