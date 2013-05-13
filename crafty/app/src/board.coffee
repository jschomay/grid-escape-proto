Crafty.c 'Board',
  init: ->
    @_board = new Array(Game.map_grid.width-1)
    # A 2D array to keep track of all occupied tiles
    for i in [0..Game.map_grid.width-1]
      @_board[i] = new Array(Game.map_grid.height-1)
      for y in [0..Game.map_grid.height-1]
        @_board[i][y] = Crafty.e("Block").at(i,y)

    # Player character, placed at 5, 5 on our grid
    @player = Crafty.e('PlayerCharacter').at(2, 2)
    @_board[2][2] = @player

    console.log "board set up", @_board
