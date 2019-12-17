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

/***/ "./src/clock.js":
/*!**********************!*\
  !*** ./src/clock.js ***!
  \**********************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony import */ var _warmup_js__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./warmup.js */ \"./src/warmup.js\");\n\n\nclass Clock {\n  constructor() {\n    // 1. Create a Date object.\n    const currentTime = new Date();\n\n    // 2. Store the hour, minute, and second.\n    this.hours = currentTime.getHours();\n    this.minutes = currentTime.getMinutes();\n    this.seconds = currentTime.getSeconds();\n\n    // 3. Call printTime.\n    // this.printTime();\n\n    // 4. Schedule the tick at 1 second intervals.\n    // setInterval(this._tick.bind(this), 1000);\n  }\n\n  printTime() {\n    // Format the time in HH:MM:SS\n    const timeString = [this.hours, this.minutes, this.seconds].join(\":\");\n\n    // htmlGenerator(timeString, );\n    // Use console.log to print it.\n    return timeString;\n  }\n\n  _tick() {\n    // 1. Increment the time by one second.\n    this._incrementSeconds();\n\n    // 2. Call printTime.\n    this.printTime();\n  }\n\n  _incrementSeconds() {\n    // 1. Increment the time by one second.\n    this.seconds += 1;\n    if (this.seconds === 60) {\n      this.seconds = 0;\n      this._incrementMinutes();\n    }\n  }\n\n  _incrementMinutes() {\n    this.minutes += 1;\n    if (this.minutes === 60) {\n      this.minutes = 0;\n      this._incrementHours();\n    }\n  }\n\n  _incrementHours() {\n    this.hours = (this.hours + 1) % 24;\n  }\n}\n\nlet clock = new Clock();\n\n/* harmony default export */ __webpack_exports__[\"default\"] = (Clock);\n\n\n\n//# sourceURL=webpack:///./src/clock.js?");

/***/ }),

/***/ "./src/drop_down.js":
/*!**************************!*\
  !*** ./src/drop_down.js ***!
  \**************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n\nconst dogs = {\n  \"Corgi\": \"https://www.akc.org/dog-breeds/cardigan-welsh-corgi/\",\n  \"Australian Shepherd\": \"https://www.akc.org/dog-breeds/australian-shepherd/\",\n  \"Affenpinscher\": \"https://www.akc.org/dog-breeds/affenpinscher/\",\n  \"American Staffordshire Terrier\": \"https://www.akc.org/dog-breeds/american-staffordshire-terrier/\",\n  \"Tosa\": \"https://www.akc.org/dog-breeds/tosa/\",\n  \"Labrador Retriever\": \"https://www.akc.org/dog-breeds/labrador-retriever/\",\n  \"French Bulldog\": \"https://www.akc.org/dog-breeds/french-bulldog/\" \n};\n\nfunction dogLinkCreator() {\n  let listOfDogs = [];\n  Object.keys(dogs).forEach((dog) => {\n    let aEl = document.createElement(\"a\");\n    aEl.innerHTML = dog;\n    aEl.setAttribute(\"href\", dogs[dog]);\n    let liEl = document.createElement(\"li\");\n    liEl.setAttribute(\"class\", \"dog-link\");\n    liEl.appendChild(aEl);\n    listOfDogs.push(liEl);\n  });\n\n  return listOfDogs;\n}\n\nfunction attachDogLinks() {\n  let dogLinks = dogLinkCreator();\n  let ulEl = document.getElementsByClassName(\"drop-down-dog-list\");\n  dogLinks.forEach(link => {\n    link.style.visibility = \"hidden\";\n    ulEl[0].appendChild(link);\n  });\n  handleEnter();\n}\n\nfunction handleEnter() {\n  let dogLinks = document.getElementsByClassName(\"dog-link\");\n    document.getElementsByClassName(\"drop-down-dog-nav\")[0].addEventListener(\"mouseenter\", event => {\n      for (let i = 0; i < dogLinks.length; i++) {\n          dogLinks[i].style.visibility = \"visible\";\n      }\n    });\n}\n\nfunction handleLeave() {\n  let dogLinks = document.getElementsByClassName(\"dog-link\");\n  document.getElementsByClassName(\"drop-down-dog-nav\")[0].addEventListener(\"mouseleave\", event => {\n    for (let i = 0; i < dogLinks.length; i++) {\n      dogLinks[i].style.visibility = \"hidden\";\n    }\n  });\n}\n\nattachDogLinks();\nhandleEnter();\nhandleLeave();\n\n/* harmony default export */ __webpack_exports__[\"default\"] = (attachDogLinks);\n\n//# sourceURL=webpack:///./src/drop_down.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no exports provided */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony import */ var _warmup__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./warmup */ \"./src/warmup.js\");\n/* harmony import */ var _drop_down_js__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./drop_down.js */ \"./src/drop_down.js\");\n/* harmony import */ var _clock_js__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ./clock.js */ \"./src/clock.js\");\n/* harmony import */ var _todo_list_js__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! ./todo_list.js */ \"./src/todo_list.js\");\n\n\n\n\n\n\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/todo_list.js":
/*!**************************!*\
  !*** ./src/todo_list.js ***!
  \**************************/
/*! exports provided: addToDo, populateList */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"addToDo\", function() { return addToDo; });\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"populateList\", function() { return populateList; });\nlet todos = [];\nlet temp = localStorage.getItem(\"todos\");\nif(temp !== ''){\n  todos = JSON.parse(temp);\n}\nlet formEl = document.getElementsByClassName(\"add-todo-form\")[0];\n\n\nfunction addToDo() {\n  for(let i = 0; i < todos.length; i++) {\n    // todo[i].done = \n    populateList(todos[i]);\n  }\n  formEl.addEventListener(\"submit\", event => {\n    let inputEl = document.getElementsByName(\"add-todo\")[0];\n    let todo = {\n      \"add-todo\": \"\",\n      \"done\": true\n    };\n    event.preventDefault();\n    todo[\"add-todo\"] = inputEl.value;\n    let temp = populateList(todos[todos.length - 1]);\n    localStorage.setItem(\"todos\", JSON.stringify(todos));\n    todos.push(temp);\n    inputEl.value = \"\";\n  });\n}\n\nfunction populateList(todo) {\n\n    const labelEl = document.createElement(\"label\");\n    labelEl.innerHTML = todo[\"add-todo\"];\n    const inputEl = document.createElement(\"input\");\n    inputEl.setAttribute(\"type\", \"checkbox\");\n    inputEl.setAttribute(\"data\", todo.done);\n    inputEl.addEventListener(\"change\", event => {\n      todo.done = !event.target.done;\n      // console.log(.done);\n      // todos.forEach((ele)=>{\n      //   if (ele === event.target){\n\n      //   }\n      // })\n    });\n    if(inputEl.checked === true){ inputEl.setAttribute('checked', true);}\n    labelEl.appendChild(inputEl);\n    const liEl = document.createElement(\"li\");\n    liEl.appendChild(labelEl);\n    const ulEl = document.getElementsByClassName(\"todos\")[0];\n    ulEl.appendChild(liEl);\n    return todo;\n}\n\n\n\naddToDo();\n\n\n\n//# sourceURL=webpack:///./src/todo_list.js?");

/***/ }),

/***/ "./src/warmup.js":
/*!***********************!*\
  !*** ./src/warmup.js ***!
  \***********************/
/*! exports provided: htmlGenerator */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"htmlGenerator\", function() { return htmlGenerator; });\n\nconst partyHeader = document.getElementById('party');\n\nconst htmlGenerator = (string, htmlElement) => {\n  const pEl = document.createElement(\"p\");\n  pEl.innerHTML = string;\n  htmlElement.appendChild(pEl);\n};\n\nhtmlGenerator('Party Time.', partyHeader);\n\n//# sourceURL=webpack:///./src/warmup.js?");

/***/ })

/******/ });