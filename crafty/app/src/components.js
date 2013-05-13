require("./player.coffee");
require("./block.coffee");
require('./board.coffee');

// The Grid component allows an element to be located
//  on a grid of tiles
Crafty.c('Grid', {
  init: function() {
    this.attr({
      w: Game.map_grid.tile.width,
      h: Game.map_grid.tile.height
    })
  },
  // Locate this entity at the given position on the grid
  at: function(x, y) {
    if (x === undefined && y === undefined) {
      return { x: this.x/Game.map_grid.tile.width, y: this.y/Game.map_grid.tile.height }
    } else {
      this.attr({ x: x * Game.map_grid.tile.width, y: y * Game.map_grid.tile.height });
      return this;
    }
  }
});

// An "Actor" is an entity that is drawn in 2D on canvas
//  via our logical coordinate grid
Crafty.c('Actor', {
  init: function() {
    this.requires('2D, Canvas, Grid');
  },
});

// exit
Crafty.c('Exit', {
  init: function() {
    this.requires('Actor, Color');
    this.color('green');
    this.bind("Draw", function (obj) {
      // Pass the Canvas context and the drawing region.
      this._draw(obj.ctx, obj.pos);
    });

  },
  _draw: function (ctx, po) {
    ctx.save();
    pos = {
      _x: po._x + 1,
      _y: po._y + 1,
      _w: po._w - 2,
      _h: po._h - 2
    };

    ctx.lineWidth = 1;
    ctx.strokeStyle = "#555555";
    ctx.beginPath();
    ctx.moveTo(pos._x, pos._y);
    ctx.lineTo(pos._x + pos._w, pos._y);
    ctx.lineTo(pos._x + pos._w, pos._y +  pos._h);
    ctx.lineTo(pos._x, pos._y +  pos._h);
    ctx.closePath();
    ctx.stroke();


    ctx.fillStyle = "black";
    ctx.lineWidth = 2;
    ctx.beginPath();
    ctx.arc(pos._x+pos._w/2, pos._y+pos._h/2, pos._w/3, 0, Math.PI*2, true) ;
    ctx.closePath();
    ctx.fill();
    ctx.stroke();
    ctx.restore();
  },
  exit: function() {
    this.destroy();
    Crafty.trigger('endLevel', this);
  }
});