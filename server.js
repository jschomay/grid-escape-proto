/*
 * Module dependencies
 */
var express = require('express'),
  // stylus = require('stylus'),
  // nib = require('nib'),
  app = express();

// function compile(str, path) {
//   return stylus(str)
//     .set('filename', path)
//     // .set('compress', true)
//     .use(nib());
// }
// app.set('views', __dirname + '/views');
// app.set('view engine', 'jade');
app.use(express.logger('dev'));
// app.use(stylus.middleware(
//   { src: __dirname + '/public',
//     compile: compile
//   }
// ));
app.use(express.static(__dirname + '/'));

// app.get('/', function (req, res) {
//   res.render('index',
//   { title : 'Home' }
//   );
// });

app.listen(3000);
console.log("Express server listening on 3000");

// consider https://github.com/dstrek/node-browserify-express