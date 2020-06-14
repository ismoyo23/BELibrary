let helper = require('../helper/index')
let BooksModels = require('../models/BooksModels')
let fs = require('fs')
module.exports = {
    GetAllBooks: async function(request, response){
            try{
                // conditions for paginations, search, sort
                let author = request.query.name_author == null ? '' : 'WHERE author.name_author LIKE "%'+request.query.name_author+'%"'

                let sort = request.query.sort == null ? '' : ' ORDER BY book_detail.id '+request.query.sort

                let page = request.query.page == null ? '' : ' LIMIT '+request.query.page

                let result = await BooksModels.AllBooksModel(author, sort, page);
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
            id_genre: request.body.id_genre,
            status: request.body.status,
            id_author: request.body.id_author,   
        }
        try{
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
                id_genre: request.body.id_genre,
                status: request.body.status,
                id_author: request.body.id_author   
            }
            let id = request.params.id
            try{
                let PathImage = await BooksModels.GetBooksById(id)
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
                let result = await BooksModels.DeleteBooks(id)
                return helper.response(response, 'success', result, 201)
            }catch(error){
                console.log(RangeError)
                return helper.response(response, 'failed', 'internal server error', 500)
            }
            
        }

    }