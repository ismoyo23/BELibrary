let conn = require('../helper/mysql')

module.exports = {
    AuthRegister: function(setData){
        return new Promise((resolve, reject) => {
            conn.query('INSERT INTO users (name_user, email, password, address, role) VALUES ("'+setData.name_user+'", "'+setData.email+'", "'+setData.password+'", "'+setData.address+'", "'+setData.role+'")', function(error, result){
                if(error){
                    reject(error)
                }else{
                    let newData= {
                    id: result.insertId,
                    ...setData
                }
                resolve(newData)
                }
            })
        })
    },

    AuthLogin: function(setData){
        return new Promise((resolve, reject) => {
            conn.query('SELECT * FROM users WHERE name_user = "'+setData.name_user+'"', function(error, result){
                if(error){
                    reject(error)
                }else{
                    resolve(result)
                }
            })
        })
    }
}