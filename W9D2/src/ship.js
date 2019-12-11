const Util = require("./util.js");
const MovingObject = require("./moving_object.js");
// const Asteroid = require("./asteroid.js");
const Bullet = require("./bullet.js");

function Ship(options) {
  this.RADIUS = 6;
  this.COLOR = 'purple';
  MovingObject.call(this, {
    pos: options.pos,
    vel: [0,0],
    radius: this.RADIUS,
    game: options.game,
    color: this.COLOR
  });
}

Util.inherits(Ship, MovingObject);

Ship.prototype.relocate = function() {
  this.pos = this.game.randomPosition();
  this.vel = [0,0];
};

Ship.prototype.power = function(impulse) {
  this.vel[0] += impulse[0];
  this.vel[1] += impulse[1];
  
  // if(Math.abs(this.vel[0]) > 10) {
  //   this.vel[0] = Math.round(this.vel[0]);
  // }
  // if (Math.abs(this.vel[1]) > 10) {
  //   this.vel[1] = Math.round(this.vel[1]);
  // }
}

Ship.prototype.fireBullet = function() {
  let bullet = new Bullet({
    vel: this.vel.slice(),
    pos: this.pos.slice(),
    game: this.game
  });
  // console.log(bullet.vel);
  this.game.bullets.push(bullet);
  console.log(this.game.bullets);
}


module.exports = Ship;