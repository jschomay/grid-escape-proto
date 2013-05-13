Crafty.c 'Block',
  ready: true # maybe this isn't needed anymore in this version of crafry?
  init: ->
    @requires "Actor, Color, Text"
    @attr
      w: Game.map_grid.tile.width
      h: Game.map_grid.tile.height
    @bind "Draw", (obj)->
        # Pass the Canvas context and the drawing region.
        @_draw obj.ctx, obj.pos

  color: (color) ->
    @_color = color || 'black'

  _draw: (ctx, po)->
    pos = 
      _x: po._x + 1
      _y: po._y + 1
      _w: po._w - 2
      _h: po._h - 2

    ctx.fillStyle = @_color
    ctx.fillRect(pos._x, pos._y, pos._w, pos._h)

    ctx.lineWidth = 1
    ctx.strokeStyle = "#333333"
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
