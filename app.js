let express = require('express')
let app = express()
require('dotenv').config()
let BodyParser = require('body-parser')
let cors = require('cors')

let morgan = require('morgan')
app.use(morgan('dev'))

let conn = require('./src/helper/mysql')

app.use(BodyParser.urlencoded({extended: true}))
app.use(BodyParser.json())

let jwt = require("jsonwebtoken")
let path = require('path')

app.use(express.static('./ser/upload/'))
app.use(express.static('./src/upload/'))
let router = require('./src/index')

// settings cors
var corsOptions = {
    origin: 'http://127.0.0.1:3000/books',
    optionsSuccessStatus: 200 
  }

// use cors
app.use(cors('*'))
app.options(cors(corsOptions))

app.use('/', cors(), router)

conn.connect(function(error){
    if(error) throw error;
    console.log('database hash connected')
})

app.listen(3000, function(){
    console.log('server run on port 3000')
})




// app.use('/Book', BookController)