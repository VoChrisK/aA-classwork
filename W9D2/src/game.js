const Asteroid = require("./asteroid.js");
// const MovingObject = require("./moving_object.js");
const Ship = require("./ship.js");

function Game() {
  this.DIM_X = 1280;
  this.DIM_Y = 720;
  this.NUM_ASTEROIDS = 0;
  this.asteroids = [];
  this.bullets = [];
  this.addAsteroids(10);
  this.ship = new Ship({
    pos: this.randomPosition(),
    game: this
  });
}

Game.prototype.randomPosition = function() {
  let width = Math.random() * this.DIM_X;
  let height = Math.random() * this.DIM_Y;
  return [width, height];
}

Game.prototype.addAsteroids = function(num) {
  let asteroid; 
  for (let i = 0; i < num; i++) {

    asteroid = new Asteroid({pos: this.randomPosition(), game: this});
    this.asteroids.push(asteroid);
    this.NUM_ASTEROIDS++;
  }
}

Game.prototype.draw = function(ctx) {
  ctx.clearRect(0, 0, this.DIM_X, this.DIM_Y);
  this.ship.draw(ctx);

  for (let i = 0; i < this.bullets.length; i++) {
    this.bullets[i].draw(ctx);
  }

  for (let i = 0; i < this.asteroids.length; i++) {
    this.asteroids[i].draw(ctx);
  }
}

Game.prototype.moveObjects = function() {
  this.ship.move();

  for (let i = 0; i < this.bullets.length; i++) {
    this.bullets[i].move();
  }

  for (let i = 0; i < this.asteroids.length; i++) {
    this.asteroids[i].move();
  }
}

Game.prototype.wrap = function(pos) {
  let new_pos = new Array(2);
  if (pos[0] >= this.DIM_X) {
    // new_pos[0] = pos[0] % this.DIM_X;
    new_pos[0] = 0;
  } else if (pos[0] < 0) {
    new_pos[0] = this.DIM_X;
  } else {
    new_pos[0] = pos[0];
  }

  if (pos[1] >= this.DIM_Y) {
    // new_pos[1] = pos[1] % this.DIM_Y;
    new_pos[1] = 0;
  } else if (pos[1] < 0) {
    new_pos[1] = this.DIM_Y;
  } else {
    new_pos[1] = pos[1];
  }

  return new_pos;
};

Game.prototype.checkCollisions = function() {
  for (let i = 0; i < this.asteroids.length; i++) {
    for(let j = i + 1; j < this.asteroids.length; j++)
    if (this.asteroids[i].isCollidedWith(this.asteroids[j])) {
      this.remove(this.asteroids, i);
      this.remove(this.asteroids, j-1);
    } else if (this.asteroids[i].isCollidedWith(this.ship)) {
      this.remove(this.asteroids, i);
      this.ship.relocate();
    }
  }

  for (let i = 0; i < this.bullets.length; i++) {
    for (let j = 0; j < this.asteroids.length; j++) {
      if (this.bullets[i].isCollidedWith(this.asteroids[i])) {
        this.remove(this.asteroids, j);
        this.remove(this.bullets, i);
      }
    }
  }
};

Game.prototype.step = function() {
  this.moveObjects();
  this.checkCollisions();
};

Game.prototype.remove = function(obj, index) {
  obj.splice(index, 1);
};

module.exports = Game;