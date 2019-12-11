const Util = require("./util.js");
const MovingObject = require("./moving_object.js");

function Bullet(options) {
  this.vel = options.vel;
  MovingObject.call(this, {
    vel: this.vel,
    pos: options.pos,
    color: 'red',
    radius: 1,
    game: options.game
  });
}

Util.inherits(Bullet, MovingObject);

module.exports = Bullet;
