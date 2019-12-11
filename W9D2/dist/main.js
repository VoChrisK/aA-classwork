/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./src/index.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./src/asteroid.js":
/*!*************************!*\
  !*** ./src/asteroid.js ***!
  \*************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Util = __webpack_require__(/*! ./util.js */ \"./src/util.js\");\nconst MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\n\nfunction Asteroid(options) {\n  this.color = 'pink';\n  this.radius = 10;\n  MovingObject.call(this, {\n    pos: options.pos,\n    vel: Util.randomVec(3),\n    color: this.color,\n    radius: this.radius,\n    game: options.game\n  });\n}\n\nUtil.inherits(Asteroid, MovingObject);\n\nmodule.exports = Asteroid;\n\n//# sourceURL=webpack:///./src/asteroid.js?");

/***/ }),

/***/ "./src/bullet.js":
/*!***********************!*\
  !*** ./src/bullet.js ***!
  \***********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Util = __webpack_require__(/*! ./util.js */ \"./src/util.js\");\nconst MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\n\nfunction Bullet(options) {\n  this.vel = options.vel;\n  MovingObject.call(this, {\n    vel: this.vel,\n    pos: options.pos,\n    color: 'red',\n    radius: 1,\n    game: options.game\n  });\n}\n\nUtil.inherits(Bullet, MovingObject);\n\nmodule.exports = Bullet;\n\n\n//# sourceURL=webpack:///./src/bullet.js?");

/***/ }),

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\");\n// const MovingObject = require(\"./moving_object.js\");\nconst Ship = __webpack_require__(/*! ./ship.js */ \"./src/ship.js\");\n\nfunction Game() {\n  this.DIM_X = 1280;\n  this.DIM_Y = 720;\n  this.NUM_ASTEROIDS = 0;\n  this.asteroids = [];\n  this.bullets = [];\n  this.addAsteroids(10);\n  this.ship = new Ship({\n    pos: this.randomPosition(),\n    game: this\n  });\n}\n\nGame.prototype.randomPosition = function() {\n  let width = Math.random() * this.DIM_X;\n  let height = Math.random() * this.DIM_Y;\n  return [width, height];\n}\n\nGame.prototype.addAsteroids = function(num) {\n  let asteroid; \n  for (let i = 0; i < num; i++) {\n\n    asteroid = new Asteroid({pos: this.randomPosition(), game: this});\n    this.asteroids.push(asteroid);\n    this.NUM_ASTEROIDS++;\n  }\n}\n\nGame.prototype.draw = function(ctx) {\n  ctx.clearRect(0, 0, this.DIM_X, this.DIM_Y);\n  this.ship.draw(ctx);\n\n  for (let i = 0; i < this.bullets.length; i++) {\n    this.bullets[i].draw(ctx);\n  }\n\n  for (let i = 0; i < this.asteroids.length; i++) {\n    this.asteroids[i].draw(ctx);\n  }\n}\n\nGame.prototype.moveObjects = function() {\n  this.ship.move();\n\n  for (let i = 0; i < this.bullets.length; i++) {\n    this.bullets[i].move();\n  }\n\n  for (let i = 0; i < this.asteroids.length; i++) {\n    this.asteroids[i].move();\n  }\n}\n\nGame.prototype.wrap = function(pos) {\n  let new_pos = new Array(2);\n  if (pos[0] >= this.DIM_X) {\n    // new_pos[0] = pos[0] % this.DIM_X;\n    new_pos[0] = 0;\n  } else if (pos[0] < 0) {\n    new_pos[0] = this.DIM_X;\n  } else {\n    new_pos[0] = pos[0];\n  }\n\n  if (pos[1] >= this.DIM_Y) {\n    // new_pos[1] = pos[1] % this.DIM_Y;\n    new_pos[1] = 0;\n  } else if (pos[1] < 0) {\n    new_pos[1] = this.DIM_Y;\n  } else {\n    new_pos[1] = pos[1];\n  }\n\n  return new_pos;\n};\n\nGame.prototype.checkCollisions = function() {\n  for (let i = 0; i < this.asteroids.length; i++) {\n    for(let j = i + 1; j < this.asteroids.length; j++)\n    if (this.asteroids[i].isCollidedWith(this.asteroids[j])) {\n      this.remove(this.asteroids, i);\n      this.remove(this.asteroids, j-1);\n    } else if (this.asteroids[i].isCollidedWith(this.ship)) {\n      this.remove(this.asteroids, i);\n      this.ship.relocate();\n    }\n  }\n\n  for (let i = 0; i < this.bullets.length; i++) {\n    for (let j = 0; j < this.asteroids.length; j++) {\n      if (this.bullets[i].isCollidedWith(this.asteroids[i])) {\n        this.remove(this.asteroids, j);\n        this.remove(this.bullets, i);\n      }\n    }\n  }\n};\n\nGame.prototype.step = function() {\n  this.moveObjects();\n  this.checkCollisions();\n};\n\nGame.prototype.remove = function(obj, index) {\n  obj.splice(index, 1);\n};\n\nmodule.exports = Game;\n\n//# sourceURL=webpack:///./src/game.js?");

/***/ }),

/***/ "./src/game_view.js":
/*!**************************!*\
  !*** ./src/game_view.js ***!
  \**************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const MoveObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\nconst Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\");\n\nfunction GameView(game, ctx) {\n  this.game = game;\n  this.ctx = ctx;\n  // this.start = this.start.bind(this);\n}\n\nGameView.prototype.start = function() {\n  const that = this;\n  setInterval(function() {\n    that.game.step();\n    that.game.draw(that.ctx);\n  }, 20);\n  that.bindKeyHandlers();\n}\n\nGameView.prototype.bindKeyHandlers = function() {\n  const that = this;\n  key('w', function() {\n    that.game.ship.power([0,-1]);\n  });\n  key('a', function() {\n    that.game.ship.power([-1,0]);\n  });\n  key('s', function() {\n    that.game.ship.power([0,1]);\n  });\n  key('d', function() {\n    that.game.ship.power([1,0]);\n  });\n  key('space', function() {\n    that.game.ship.fireBullet();\n  });\n}\n\nmodule.exports = GameView;\n\n//# sourceURL=webpack:///./src/game_view.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\nconst Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\");\nconst Util = __webpack_require__(/*! ./util.js */ \"./src/util.js\");\nconst Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\")\nconst GameView = __webpack_require__(/*! ./game_view.js */ \"./src/game_view.js\")\n\ndocument.addEventListener('DOMContentLoaded', (event) => {\n  const canvasEl = document.getElementById(\"game-canvas\");\n  const ctx = canvasEl.getContext(\"2d\");\n\n  const g = new Game();\n  let gv = new GameView(g, ctx);\n  gv.start();\n});\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/moving_object.js":
/*!******************************!*\
  !*** ./src/moving_object.js ***!
  \******************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("function MovingObject(options) {\n  this.pos = options[\"pos\"];\n  this.vel = options[\"vel\"];\n  this.radius = options[\"radius\"];\n  this.color = options[\"color\"];\n  this.game = options[\"game\"];\n}\n\nMovingObject.prototype.draw = function(ctx) {\n  ctx.beginPath();\n  ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 360);\n  ctx.strokeStyle = this.color;\n  ctx.lineWidth = 10;\n  ctx.stroke();\n  ctx.fill();\n}\n\nMovingObject.prototype.move = function () {\n\n    this.pos = this.game.wrap(this.pos);\n    this.pos[0] +=  this.vel[0];\n    this.pos[1] +=  this.vel[1];\n}\n\nMovingObject.prototype.isCollidedWith = function(otherObject) {\n  let distance = new Array(2);\n  distance[0] = Math.abs(this.pos[0] - otherObject.pos[0]);\n  distance[1] = Math.abs(this.pos[1] - otherObject.pos[1]);\n  let center_distance = Math.sqrt(Math.pow(distance[0], 2) + Math.pow(distance[1], 2));\n\n  return (center_distance <= this.radius + otherObject.radius);\n}\n\n// MovingObject.prototype.collideWith = function(otherObject) {\n//   this.game.remove\n// }\n\nmodule.exports = MovingObject;\n\n\n\n\n//# sourceURL=webpack:///./src/moving_object.js?");

/***/ }),

/***/ "./src/ship.js":
/*!*********************!*\
  !*** ./src/ship.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Util = __webpack_require__(/*! ./util.js */ \"./src/util.js\");\nconst MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\n// const Asteroid = require(\"./asteroid.js\");\nconst Bullet = __webpack_require__(/*! ./bullet.js */ \"./src/bullet.js\");\n\nfunction Ship(options) {\n  this.RADIUS = 6;\n  this.COLOR = 'purple';\n  MovingObject.call(this, {\n    pos: options.pos,\n    vel: [0,0],\n    radius: this.RADIUS,\n    game: options.game,\n    color: this.COLOR\n  });\n}\n\nUtil.inherits(Ship, MovingObject);\n\nShip.prototype.relocate = function() {\n  this.pos = this.game.randomPosition();\n  this.vel = [0,0];\n};\n\nShip.prototype.power = function(impulse) {\n  this.vel[0] += impulse[0];\n  this.vel[1] += impulse[1];\n  \n  // if(Math.abs(this.vel[0]) > 10) {\n  //   this.vel[0] = Math.round(this.vel[0]);\n  // }\n  // if (Math.abs(this.vel[1]) > 10) {\n  //   this.vel[1] = Math.round(this.vel[1]);\n  // }\n}\n\nShip.prototype.fireBullet = function() {\n  let bullet = new Bullet({\n    vel: this.vel.slice(),\n    pos: this.pos.slice(),\n    game: this.game\n  });\n  // console.log(bullet.vel);\n  this.game.bullets.push(bullet);\n  console.log(this.game.bullets);\n}\n\n\nmodule.exports = Ship;\n\n//# sourceURL=webpack:///./src/ship.js?");

/***/ }),

/***/ "./src/util.js":
/*!*********************!*\
  !*** ./src/util.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("\n\nconst Util = {\n  randomVec(length) {\n    const deg = 2 * Math.PI * Math.random();\n    return Util.scale([Math.sin(deg), Math.cos(deg)], length);\n  },\n\n  // Scale the length of a vector by the given amount.\n  scale(vec, m) {\n    return [vec[0] * m, vec[1] * m];\n  },\n\n  inherits(childClass, parentClass) {\n    function Surrogate() {}\n    Surrogate.prototype = parentClass.prototype;\n    childClass.prototype = new Surrogate();\n    childClass.prototype.constructor = childClass;\n  }\n};\n\nmodule.exports = Util;\n\n//# sourceURL=webpack:///./src/util.js?");

/***/ })

/******/ });