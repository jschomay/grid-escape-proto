# exit
Crafty.c 'Exit',
  init: ->
    @requires 'Actor, Color, Collision'
    @color 'green'
    @bind "Draw", (obj) ->
      # Pass the Canvas context and the drawing region.
      @_draw obj.ctx, obj.pos

    @bind "endLevel", @endLevel

  _draw: (ctx, po) ->
    ctx.save()
    pos = 
      _x: po._x + 1
      _y: po._y + 1
      _w: po._w - 2
      _h: po._h - 2

    # outline
    ctx.lineWidth = 1
    ctx.strokeStyle = "#555555"
    ctx.beginPath()
    ctx.moveTo(pos._x, pos._y)
    ctx.lineTo(pos._x + pos._w, pos._y)
    ctx.lineTo(pos._x + pos._w, pos._y +  pos._h)
    ctx.lineTo(pos._x, pos._y +  pos._h)
    ctx.closePath()
    ctx.stroke()

    # circle
    ctx.fillStyle = "black"
    ctx.lineWidth = 2
    ctx.beginPath()
    ctx.arc(pos._x+pos._w/2, pos._y+pos._h/2, pos._w/3, 0, Math.PI*2, true) 
    ctx.closePath()
    ctx.fill()
    ctx.stroke()
    ctx.restore()

  endLevel: ->
    @unbind "endLevel"
    console.log "exit.endLevel"
    # set next startpos
    Game.state.startPos =
      x: @x/Game.map_grid.tile.width
      y: @y/Game.map_grid.tile.height

    @timeout (-> Crafty.scene "Game"), 1200
    # suck player into hole
    player = Crafty "PlayerCharacter"
    player.addComponent "Tween"
    # move/shrink
    player.tween
      x: @x+player.w/4
      y: @y+player.h/4
      w: player.w/2
      h: player.w/2
    , 30
    #fade into shadow
    @timeout (-> player.tween {alpha:0},20),500
