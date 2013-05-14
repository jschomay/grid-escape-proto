#  This is the player-controlled character

Crafty.c 'PlayerCharacter', 
  ready: true
  init: -> 
    @requires('Actor, Fourway, Collision')
    @hitbox = new Crafty.circle(@_w/2, @_h/2, @_w/4)
    @collision(@hitbox)
    .fourway(3)
    .onHit('Block', @hitBlock)
    .onHit('Solid', @crash)
    .onHit('Exit', @hitExit)

    @bind "Move", @onMove
    @bind "Draw", (obj)->
      # Pass the Canvas context and the drawing region.
      @_draw obj.ctx, obj.pos


  onMove: (movement) ->
    if @hitbox.containsPoint(0, @y+@h/2) or 
    @hitbox.containsPoint(Game.map_grid.width*Game.map_grid.tile.width, @y+@h/2) or
    @hitbox.containsPoint(@x+@w/2, 0) or
    @hitbox.containsPoint(@x+@w/2, Game.map_grid.height*Game.map_grid.tile.height)
      @crash()

  hitBlock: (data) ->
    for collision in data
      block = collision.obj
      block.destroy()
      console.log "Block destroyed"

  crash: (data) ->
    # stop movement
    # @stopMovement()
    console.log 'you crashed'
    @timeout (-> 
      console.log "restart level"
      Crafty.e('PlayerCharacter').at(Game.state.startPos.x, Game.state.startPos.y)
      ), 1000
    @destroy()

  hitExit: (data) ->
    console.log "Hit exit"
    @disableControl()
    Crafty.trigger "endLevel"

  # Stops the movement
  stopMovement: () ->
    # @._speed = 0
    if @_movement
      @x -= @_movement.x
      @y -= @_movement.y

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