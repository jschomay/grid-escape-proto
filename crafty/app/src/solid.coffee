Crafty.c 'Solid',
  ready: true
  init: ->
    @_color = '#222222'
    @requires "Actor, Collision"
    @attr
      w: Game.map_grid.tile.width
      h: Game.map_grid.tile.height
    @bind "Draw", (obj)->
      # Pass the Canvas context and the drawing region.
      @_draw obj.ctx, obj.pos

  _draw: (ctx, po)->
    ctx.save()
    pos = 
      _x: po._x + 2
      _y: po._y + 2
      _w: po._w - 4
      _h: po._h - 4

    ctx.fillStyle = @_color
    ctx.fillRect(pos._x, pos._y, pos._w, pos._h)

    ctx.lineWidth = 4
    ctx.strokeStyle = "#000000"
    ctx.beginPath()
    ctx.moveTo(pos._x, pos._y)
    ctx.lineTo(pos._x + pos._w, pos._y)
    ctx.lineTo(pos._x + pos._w, pos._y +  pos._h)
    ctx.lineTo(pos._x, pos._y +  pos._h)
    ctx.closePath()
    ctx.stroke()
    ctx.restore()
