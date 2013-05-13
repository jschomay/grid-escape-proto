require('./components');

# Game scene
# -------------
# Runs the core gameplay loop
Crafty.scene 'Game', ->
   # A 2D array to keep track of all occupied tiles
  for i in [0..Game.map_grid.width]
    for y in [0..Game.map_grid.height]
      Crafty.e("Block").at(i,y)

  # Player character, placed at 5, 5 on our grid
  # @player = Crafty.e('PlayerCharacter').at(5, 5)



# Loading scene
# -------------
# Handles the loading of binary assets such as images and audio files
Crafty.scene 'Loading', ->
  # Draw some text for the player to see in case the file
  # takes a noticeable amount of time to load
  Crafty.e('2D, DOM, Text')
    .text('Loading please wait...')
    .attr({ x: 0, y: Game.height()/2 - 24, w: Game.width() })
    .css($text_css)

  Crafty.scene('Game')
