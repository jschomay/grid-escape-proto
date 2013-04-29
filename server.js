// enchilda runs browserify as middleware
// https://github.com/shtylman/node-enchilada
var enchilada = require('enchilada');
var express = require('express');
var app = express();

app.use(enchilada({
    src: __dirname + '/crafty/app/', // location of your js files
    cache: false, // default false (use true for production to disable file watching)
    compress: false, // default false
    debug: false, // default false (enable sourcemap output with bundle)
    watchCallback: function(filename) {console.log("Re-browserifying.  File changed:", filename, ' at ', new Date());}, // optional (use to do something clever, like tell client to reload the page)
    routes: {
        // 'lib/crafty.js': '.lib/crafty.js'
    },
    transforms: ['coffeeify']
}));

app.use(express.static(__dirname + '/crafty/app'));
app.use(express.logger('dev'));
app.listen(3000);
console.log("Express server listening on 3000, using enchilada for automatic browserifying");
