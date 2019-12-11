function MovingObject(options) {
  this.pos = options["pos"];
  this.vel = options["vel"];
  this.radius = options["radius"];
  this.color = options["color"];
  this.game = options["game"];
}

MovingObject.prototype.draw = function(ctx) {
  ctx.beginPath();
  ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 360);
  ctx.strokeStyle = this.color;
  ctx.lineWidth = 10;
  ctx.stroke();
  ctx.fill();
}

MovingObject.prototype.move = function () {

    this.pos = this.game.wrap(this.pos);
    this.pos[0] +=  this.vel[0];
    this.pos[1] +=  this.vel[1];
}

MovingObject.prototype.isCollidedWith = function(otherObject) {
  let distance = new Array(2);
  distance[0] = Math.abs(this.pos[0] - otherObject.pos[0]);
  distance[1] = Math.abs(this.pos[1] - otherObject.pos[1]);
  let center_distance = Math.sqrt(Math.pow(distance[0], 2) + Math.pow(distance[1], 2));

  return (center_distance <= this.radius + otherObject.radius);
}

// MovingObject.prototype.collideWith = function(otherObject) {
//   this.game.remove
// }

module.exports = MovingObject;


