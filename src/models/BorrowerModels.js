let conn = require('../helper/mysql')

module.exports = {
    GetBorrowerModels: function(name_user){
        return new Promise((resolve, reject) => {
            conn.query('SELECT id_borrower, name_user, email, address, title, image, create_at FROM borrower INNER JOIN book_detail ON borrower.id_book = book_detail.id INNER JOIN users ON borrower.id_user = users.id_user' + name_user, function(error,result){
                if(error){
                    reject(error)
                }
                resolve(result)
            })
        })
    },

    CreateBorrowerModels: function(setData){
        return new Promise((resolve, reject)=>{
            conn.query("INSERT INTO borrower(id_book, id_user, count, status) VALUES ('"+setData.id_books+"', '"+setData.id_user+"','"+setData.count+"', '"+setData.status+"')", function(error, result){
                  
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

    UpdateBorrowerModels: function(setData, id){
        return new Promise((resolve,reject)=> {
  
        conn.query('UPDATE borrower SET id_book = "'+setData.id_books+'",  id_user= "'+setData.id_user+'", count="'+setData.count+'", status = "'+setData.status+'" WHERE id_borrower = "'+id+'"', function(error, result){
          if(error) {
              reject(error)
          }
          let newData= {
              id: id,
              ...setData
          }
          resolve(newData)
        })
        })
    },

    DeleteBorrowerModels: function(id){
        return new Promise((resolve, reject) => {
            conn.query('DELETE FROM borrower WHERE id_borrower= "'+id+'"', function(error,result){
                if(error) {
                    reject(error)
                }
                
                resolve(result)
                
              
            })
        })
    }
}