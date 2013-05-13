Crafty.c 'Block',
  ready: true
  init: ->
    @_color = 'black'
    @requires "Actor, Collision"
    @attr
      w: Game.map_grid.tile.width
      h: Game.map_grid.tile.height
    @bind "Draw", (obj)->
      # Pass the Canvas context and the drawing region.
      @_draw obj.ctx, obj.pos

  color: (color) ->
    @_color = color

  _draw: (ctx, po)->
    ctx.save()
    pos = 
      _x: po._x + 1
      _y: po._y + 1
      _w: po._w - 2
      _h: po._h - 2

    ctx.fillStyle = @_color
    ctx.fillRect(pos._x, pos._y, pos._w, pos._h)

    ctx.lineWidth = 1
    ctx.strokeStyle = "#555555"
    ctx.beginPath()
    ctx.moveTo(pos._x, pos._y)
    ctx.lineTo(pos._x + pos._w, pos._y)
    ctx.lineTo(pos._x + pos._w, pos._y +  pos._h)
    ctx.lineTo(pos._x, pos._y +  pos._h)
    ctx.closePath()
    ctx.stroke()
    ctx.moveTo(pos._x, pos._y)
    ctx.lineTo(pos._x + pos._w, pos._y +  pos._h)
    ctx.stroke()
    ctx.moveTo(pos._x + pos._w, pos._y)
    ctx.lineTo(pos._x, pos._y +  pos._h)
    ctx.stroke()
    ctx.restore()
