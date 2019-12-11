import FlappyBird from './game';
import Level from "./level"

const canvas = document.getElementById('bird-game');
const game = new FlappyBird(canvas);
const level = new Level(game.dimensions);
level.drawBackground(game.ctx);
