require('./components');

# Game scene
# -------------
# Runs the core gameplay loop
Crafty.scene 'Game', ->
  # load the board
  @board = Crafty.e('Board')



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
