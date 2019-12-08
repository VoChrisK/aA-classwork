Array.prototype.bubbleSort = function() {
    let sorted = false;
    while(!sorted) {
        sorted = true;
        for(let i = 0; i < this.length-1; i++) {
            if(this[i] > this[i+1]) {
                let temp = this[i];
                this[i] = this[i+1];
                this[i+1] = temp;
                sorted = false;
            }
        }
    }
    return this;
};

String.prototype.subStrings = function() {
    let substrings = [];

    for(let i = 0; i < this.length; i++) {
        substrings.push(this.charAt(i));
        for(let j = i + 1; j < this.length; j++) {
            substrings.push(this.substr(i, j));
        }
    }

    return substrings;
};