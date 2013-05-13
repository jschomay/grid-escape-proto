Crafty.c 'Board',
  init: ->

    avoidStartPos = (x,y) ->
      # starting space always blank, with at least 1 other nearby space blank
      # algorithm could be improved or adjusted after testing
      nearX = Crafty.math.randomInt(0,10) > 8
      nearY = Crafty.math.randomInt(0,10) > 8
      if !nearX and !nearY then nearY = 1
      return Crafty.math.abs(x - Game.state.startPos.x) > nearX or Crafty.math.abs(y - Game.state.startPos.y) > nearY

    # add exit in random position (not near startpos)
    loop
      exitX = Crafty.math.randomInt 0, Game.map_grid.width-1
      exitY = Crafty.math.randomInt 0, Game.map_grid.height-1
      console.log exitX,exitY
      break if avoidStartPos exitX, exitY

    @exit = Crafty.e('Exit').at exitX, exitY

    for x in [0..Game.map_grid.width-1]
      for y in [0..Game.map_grid.height-1]
        if avoidStartPos(x,y) and Crafty.math.randomInt 0,4
          Crafty.e("Block").at(x,y)

    # Player character, placed at 5, 5 on our grid
    @player = Crafty.e('PlayerCharacter').at(Game.state.startPos.x, Game.state.startPos.y)

