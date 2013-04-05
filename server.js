// using https://github.com/ForbesLindesay/browserify-middleware
var browserify = require('browserify-middleware');
var express = require('express');
var app = express();

//provide browserified versions of all the files in a directory
app.use('/src', browserify('crafty/app/src'));

app.use(express.static(__dirname + '/crafty/app'));
app.use(express.logger('dev'));
app.listen(3000);
console.log("Express server listening on 3000");
