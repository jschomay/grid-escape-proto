#  This is the player-controlled character

Crafty.c 'PlayerCharacter', 
  ready: true
  init: -> 
    @requires('Actor, Fourway, Collision')
    .collision(new Crafty.circle(@_w/2, @_h/2, @_w/4))
    .fourway(3)
    .onHit('Block', @hitBlock)
    .onHit('Exit', @hitExit)

    @bind "Draw", (obj)->
      # Pass the Canvas context and the drawing region.
      @_draw obj.ctx, obj.pos

  hitBlock: (data) ->
    for collision in data
      block = collision.obj
      block.destroy()
      console.log "Block destroyed"

  hitExit: (data) ->
    console.log "Hit exit"
    @disableControl()
    Crafty.trigger "endLevel"

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
    ctx.arc(@x+pos._w/2, @y+pos._h/2, pos._w/4, 0, Math.PI*2, true) 
    ctx.closePath()
    ctx.fill()
    ctx.restore()