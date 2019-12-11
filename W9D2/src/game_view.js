const MoveObject = require("./moving_object.js");
const Game = require("./game.js");

function GameView(game, ctx) {
  this.game = game;
  this.ctx = ctx;
  // this.start = this.start.bind(this);
}

GameView.prototype.start = function() {
  const that = this;
  setInterval(function() {
    that.game.step();
    that.game.draw(that.ctx);
  }, 20);
  that.bindKeyHandlers();
}

GameView.prototype.bindKeyHandlers = function() {
  const that = this;
  key('w', function() {
    that.game.ship.power([0,-1]);
  });
  key('a', function() {
    that.game.ship.power([-1,0]);
  });
  key('s', function() {
    that.game.ship.power([0,1]);
  });
  key('d', function() {
    that.game.ship.power([1,0]);
  });
  key('space', function() {
    that.game.ship.fireBullet();
  });
}

module.exports = GameView;