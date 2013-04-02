// ship
var Ship = function(rect) {
   // call superconstructor
   Ship.superConstructor.apply(this, arguments);
   this.speed = 50;
   this.rect = new gamejs.Rect(rect);
   return this;
};
gamejs.utils.objects.extend(Ship, gamejs.sprite.Sprite);

Ship.prototype.update = function(msDuration) {
   this.rect.moveIp(0, this.speed * (msDuration/1000));
   error
};


Ship.prototype.draw = function(display) {
   var color = '#000';
   var stroke = 0; // lineWidth zero fills the circle
   gamejs.draw.rect(display, color, this.rect, stroke);
};
