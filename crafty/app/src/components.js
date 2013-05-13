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

// A Tree is just an Actor with a certain sprite
Crafty.c('Tree', {
  init: function() {
    this.requires('Actor, Solid, spr_tree');
  },
});

// A Bush is just an Actor with a certain sprite
Crafty.c('Bush', {
  init: function() {
    this.requires('Actor, Solid, spr_bush');
  },
});

// A Rock is just an Actor with a certain sprite
Crafty.c('Rock', {
  init: function() {
    this.requires('Actor, Solid, spr_rock');
  },
});


// A village is a tile on the grid that the PC must visit in order to win the game
Crafty.c('Village', {
  init: function() {
    this.requires('Actor, spr_village');
  },

  // Process a visitation with this village
  visit: function() {
    this.destroy();
    Crafty.audio.play('knock');
    Crafty.trigger('VillageVisited', this);
  }
});