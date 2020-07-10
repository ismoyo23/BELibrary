let conn = require('../helper/mysql')

module.exports = {
    AllBooksModel: function(param){
        return new Promise((resolve, reject)=>{
                conn.query(`SELECT id, book_detail.id_genre, book_detail.id_author, title, discription, stok, image, name_author, profile_author, name_genre FROM book_detail INNER JOIN genre ON book_detail.id_genre = genre.id_genre INNER JOIN author ON book_detail.id_author = author.id_author ${param.byfield}${param.sort}${param.page}`, function(error, result){
                    if(error){
                        reject(error)
                    }
                    resolve(result)
                })

        })
    },

    GetBooksById: function(id){
        return new Promise((resolve, reject)=>{
            conn.query('SELECT * FROM book_detail WHERE id = "'+id+'"', function(error, result){
                if(error){
                    reject(error)
                }
                resolve(result)
            })
        })
    },

    CreateBooksModel: function(setData){
        return new Promise((resolve, reject)=>{
            conn.query("INSERT INTO book_detail(title, discription, image,stok ,id_genre, id_author) VALUES('"+setData.title+"','"+setData.discription+"', '"+setData.image+"', '"+setData.stok+"', '"+setData.id_genre+"', '"+setData.id_author+"')", function(error, result){
                  
                if(error) {
                    reject(error)
                }
                let newData= {
                    ...setData
                }
                resolve(newData)
                
          
              })
        })
    },

    UpdateBooksModel: function(setData, id){
        return new Promise((resolve, reject)=>{
            conn.query("UPDATE book_detail SET title='"+setData.title+"',discription='"+setData.discription+"',image='"+setData.image+"',stok='"+setData.stok+"', id_genre= '"+setData.id_genre+"', id_author='"+setData.id_author+"' WHERE id = '"+id+"'", function(error, result){
                if(error){
                   reject(error)
                }
                let newData = {
                    id: id,
                    ...setData
                }  
                resolve(newData)
            })
        })
    },

    DeleteBooksModels: function(id){
        return new Promise((resolve, reject) => {
            conn.query('DELETE FROM book_detail WHERE id = '+id+'', function(error, result){
                if(error){
                    reject(error)
                }
                resolve(result)
            })
        })
    }
}