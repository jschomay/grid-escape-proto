
gamejs = require('gamejs');
include(['../javascript/ship.js']);

var SCREEN_WIDTH = 600;
var SCREEN_HEIGHT = 600;


function main() {

   var background = new gamejs.sprite.Sprite([0,0,SCREEN_WIDTH, SCREEN_HEIGHT]);
   background.draw = function (display) {
      gamejs.draw.line(display, "#000", [50,100], [300,455], 3);
   };


   // ball changes color on mouse up
   function handleEvent(event) {
      switch(event.type) {
         case gamejs.event.MOUSE_UP:
            break;
      }
   }

   // handle events.
   // update models.
   // clear screen.
   // draw screen.
   // called ~ 30 times per second by fps.callback
   // msDuration = actual time in milliseconds since last call
   function gameTick(msDuration) {
      gamejs.event.get().forEach(function(event) {
         handleEvent(event);
      });
      ship.update(msDuration);
      display.clear();
      ship.draw(display);
      background.draw(display);
   }

   // setup screen and ball.
   // ball in screen center.
   // start game loop.
   var display = gamejs.display.setMode([SCREEN_WIDTH, SCREEN_HEIGHT]);


   var shipDim = [40,40];
   var centerScreen = [(SCREEN_WIDTH - shipDim[0])/ 2, (SCREEN_HEIGHT - shipDim[1]) / 2];
   var shipPos = centerScreen;
   var shipRect = shipPos.concat(shipDim);
   var ship = new Ship(shipRect);
   gamejs.time.interval(gameTick);
}

// call main after all resources have finished loading
gamejs.ready(main);