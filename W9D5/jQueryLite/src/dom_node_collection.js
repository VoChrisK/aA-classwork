class DomNodeCollection {
    constructor(htmlElements) {
        this.htmlElements = htmlElements;
    }
    
    html(string) {
        if(!string) return this.htmlElements[0].innerHTML;

        this.myEach((htmlElement) => {
            htmlElement.innerHTML = string;
        });
        
        return this;
    }
    
    empty() {
        this.myEach((htmlElement) => {
            htmlElement.innerHTML = "";
        });

        return this;
    }
    
    append(arg) {
        if (typeof arg === "string") {
            this.html(arg);
        } else if(arg instanceof HTMLElement) {
            this._appendElementToHTMLElements(arg);
        } else {
            // debugger
            this._append(arg);
        }

        return this;
    }

    _append(collection) {
        collection.myEach((htmlElement) => {
            this._appendElementToHTMLElements(htmlElement);
        });
    }

    _appendElementToHTMLElements(htmlEl) {
        this.myEach((htmlElement) => {
            let appendHtmlEl = htmlEl.cloneNode(true);
            htmlElement.append(appendHtmlEl);
        });
    }
    
    attr(attribute, value) {
        if(value === undefined) {
            let val;
            this.myEach((htmlElement) => {
                // debugger;
                if (htmlElement.getAttribute(attribute)) {
                    if(!val) val = htmlElement.getAttribute(attribute);
                }
            });
            return val;
        } else {
            this.myEach((htmlElement) => {
                htmlElement.setAttribute(attribute, value);
            });
            return this;
        }
    }

    addClass(val) {
        this.attr("class", val);
        return this;
    }
    removeClass() {
        this.myEach((htmlElement) => {
            htmlElement.removeAttribute("class");
        });
        return this;
    }

    children() {
        let childHtmlElements = [];

        this.myEach( (htmlElement) => {
            childHtmlElements = childHtmlElements.concat(Array.from(htmlElement.children));
        });
        
        const domChildren = new DomNodeCollection(childHtmlElements);
        return domChildren;
    }
    
    parent() {
        let parentHtmlElements = [];
        
        this.myEach( (htmlElement) => {
            if (!parentHtmlElements.includes(htmlElement.parentElement)){
                parentHtmlElements.push(htmlElement.parentElement);
            }
        });
        
        const domParents = new DomNodeCollection(parentHtmlElements);
        return domParents;
    }
    
    find(str) {
        let queriedHtmlElements = [];
    
        this.myEach( (htmlElement) => {
            queriedHtmlElements = queriedHtmlElements.concat(Array.from(htmlElement.querySelectorAll(str)));
        });
        
        const domQueries = new DomNodeCollection(queriedHtmlElements);
        return domQueries;
    }
    
    remove(){
        this.myEach( (htmlElement) => {
            htmlElement.remove();
        });
        return this
    }

    myEach(callback) {
        for (let i = 0; i < this.htmlElements.length; i++) {
            callback(this.htmlElements[i]);
        }
    }
}

module.exports = DomNodeCollection;