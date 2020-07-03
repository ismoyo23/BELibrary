var express = require('express')
let router = express.Router()

// for librarian
let Books = require('./router/Books')
let BooksGenre = require('./router/BooksGenre')
let BooksAuthor = require('./router/BooksAuthor')
let Auth = require('./router/AuthRouter')
let BooksBorrower = require('./router/BooksBorrower')

router.use('/books', Books)
router.use('/books/genre', BooksGenre)
router.use('/books/author', BooksAuthor)
router.use('/Books/borrower', BooksBorrower)
router.use('/books/', Auth)

module.exports = router