#  This is the player-controlled character

Crafty.c 'PlayerCharacter', 
  init: -> 
    @requires('Actor, Fourway, Collision, spr_player, SpriteAnimation')
      .fourway(2)
      .stopOnSolids()
      .onHit('Village', @visitVillage)
      # // These next lines define our four animations
      # //  each call to .animate specifies:
      # //  - the name of the animation
      # //  - the x and y coordinates within the sprite
      # //     map at which the animation set begins
      # //  - the number of animation frames *in addition to* the first one
      .animate('PlayerMovingUp',    0, 0, 2)
      .animate('PlayerMovingRight', 0, 1, 2)
      .animate('PlayerMovingDown',  0, 2, 2)
      .animate('PlayerMovingLeft',  0, 3, 2)

    # // Watch for a change of direction and switch animations accordingly
    animation_speed = 10
    @bind 'NewDirection', (data) ->
      if data.x > 0 
        @.animate('PlayerMovingRight', animation_speed, -1)
      else if data.x < 0
        @.animate('PlayerMovingLeft', animation_speed, -1)
      else if data.y > 0
        @.animate('PlayerMovingDown', animation_speed, -1)
      else if data.y < 0
        @.animate('PlayerMovingUp', animation_speed, -1)
      else
        @.stop()

  # // Registers a stop-movement function to be called when
  # //  this entity hits an entity with the "Solid" component
  stopOnSolids: ->
    @onHit 'Solid', @stopMovement
    @

  # // Stops the movement
  stopMovement: ->
    @._speed = 0
    if this._movement
      this.x -= this._movement.x
      this.y -= this._movement.y

  # // Respond to this player visiting a village
  visitVillage: (data) ->
    villlage = data[0].obj
    villlage.visit()
