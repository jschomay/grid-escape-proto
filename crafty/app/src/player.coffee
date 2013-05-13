#  This is the player-controlled character

Crafty.c 'PlayerCharacter', 
  ready: true
  init: -> 
    @requires('Actor, Fourway')
      .fourway(2)
      # .stopOnSolids()

    @bind "Draw", (obj)->
      # Pass the Canvas context and the drawing region.
      @_draw obj.ctx, obj.pos

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

  _draw: (ctx, po)->
    ctx.save()
    pos = 
      _x: po._x + 1
      _y: po._y + 1
      _w: po._w - 2
      _h: po._h - 2

    ctx.fillStyle = "blue"
    ctx.beginPath()
    ctx.arc(pos._x+pos._w/2, pos._y+pos._h/2, pos._w/3, 0, Math.PI*2, true) 
    ctx.closePath()
    ctx.fill()
    ctx.restore()