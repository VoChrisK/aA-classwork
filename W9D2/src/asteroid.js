const Util = require("./util.js");
const MovingObject = require("./moving_object.js");

function Asteroid(options) {
  this.color = 'pink';
  this.radius = 10;
  MovingObject.call(this, {
    pos: options.pos,
    vel: Util.randomVec(3),
    color: this.color,
    radius: this.radius,
    game: options.game
  });
}

Util.inherits(Asteroid, MovingObject);

module.exports = Asteroid;