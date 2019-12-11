const MovingObject = require("./moving_object.js");
const Asteroid = require("./asteroid.js");
const Util = require("./util.js");
const Game = require("./game.js")
const GameView = require("./game_view.js")

document.addEventListener('DOMContentLoaded', (event) => {
  const canvasEl = document.getElementById("game-canvas");
  const ctx = canvasEl.getContext("2d");

  const g = new Game();
  let gv = new GameView(g, ctx);
  gv.start();
});