const DomNodeCollection = require("./dom_node_collection.js");

Window.prototype.$l = (arg) => {
    if (arg instanceof HTMLElement || typeof arg === "string") {
        const nodeList = document.querySelectorAll(arg);
        const argNodeCollection = new DomNodeCollection(Array.from(nodeList));
        return argNodeCollection;
    }
};