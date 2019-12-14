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

/***/ "./src/dom_node_collection.js":
/*!************************************!*\
  !*** ./src/dom_node_collection.js ***!
  \************************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("class DomNodeCollection {\n    constructor(htmlElements) {\n        this.htmlElements = htmlElements;\n    }\n    \n    html(string) {\n        if(!string) return this.htmlElements[0].innerHTML;\n\n        this.myEach((htmlElement) => {\n            htmlElement.innerHTML = string;\n        });\n        \n        return this;\n    }\n    \n    empty() {\n        this.myEach((htmlElement) => {\n            htmlElement.innerHTML = \"\";\n        });\n\n        return this;\n    }\n    \n    append(arg) {\n        if (typeof arg === \"string\") {\n            this.html(arg);\n        } else if(arg instanceof HTMLElement) {\n            this._appendElementToHTMLElements(arg);\n        } else {\n            // debugger\n            this._append(arg);\n        }\n\n        return this;\n    }\n\n    _append(collection) {\n        collection.myEach((htmlElement) => {\n            this._appendElementToHTMLElements(htmlElement);\n        });\n    }\n\n    _appendElementToHTMLElements(htmlEl) {\n        this.myEach((htmlElement) => {\n            let appendHtmlEl = htmlEl.cloneNode(true);\n            htmlElement.append(appendHtmlEl);\n        });\n    }\n    \n    attr(attribute, value) {\n        if(value === undefined) {\n            let val;\n            this.myEach((htmlElement) => {\n                // debugger;\n                if (htmlElement.getAttribute(attribute)) {\n                    if(!val) val = htmlElement.getAttribute(attribute);\n                }\n            });\n            return val;\n        } else {\n            this.myEach((htmlElement) => {\n                htmlElement.setAttribute(attribute, value);\n            });\n            return this;\n        }\n    }\n\n    addClass(val) {\n        this.attr(\"class\", val);\n        return this;\n    }\n    removeClass() {\n        this.myEach((htmlElement) => {\n            htmlElement.removeAttribute(\"class\");\n        });\n        return this;\n    }\n\n    children() {\n        let childHtmlElements = [];\n\n        this.myEach( (htmlElement) => {\n            childHtmlElements = childHtmlElements.concat(Array.from(htmlElement.children));\n        });\n        \n        const domChildren = new DomNodeCollection(childHtmlElements);\n        return domChildren;\n    }\n    \n    parent() {\n        let parentHtmlElements = [];\n        \n        this.myEach( (htmlElement) => {\n            if (!parentHtmlElements.includes(htmlElement.parentElement)){\n                parentHtmlElements.push(htmlElement.parentElement);\n            }\n        });\n        \n        const domParents = new DomNodeCollection(parentHtmlElements);\n        return domParents;\n    }\n    \n    find(str) {\n        let queriedHtmlElements = [];\n    \n        this.myEach( (htmlElement) => {\n            queriedHtmlElements = queriedHtmlElements.concat(Array.from(htmlElement.querySelectorAll(str)));\n        });\n        \n        const domQueries = new DomNodeCollection(queriedHtmlElements);\n        return domQueries;\n    }\n    \n    remove(){\n        this.myEach( (htmlElement) => {\n            htmlElement.remove();\n        });\n        return this\n    }\n\n    myEach(callback) {\n        for (let i = 0; i < this.htmlElements.length; i++) {\n            callback(this.htmlElements[i]);\n        }\n    }\n}\n\nmodule.exports = DomNodeCollection;\n\n//# sourceURL=webpack:///./src/dom_node_collection.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const DomNodeCollection = __webpack_require__(/*! ./dom_node_collection.js */ \"./src/dom_node_collection.js\");\n\nWindow.prototype.$l = (arg) => {\n    if (arg instanceof HTMLElement || typeof arg === \"string\") {\n        const nodeList = document.querySelectorAll(arg);\n        const argNodeCollection = new DomNodeCollection(Array.from(nodeList));\n        return argNodeCollection;\n    }\n};\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ })

/******/ });