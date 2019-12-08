Array.prototype.uniq = function() {
    let newArr = [];
    for(let i = 0; i < this.length; i++) {
        if(!newArr.includes(this[i])) newArr.push(this[i]);
    }
    return newArr;
};

Array.prototype.twoSum = function() {
    let pairs = [];
    let sumHash = {};
    for(let i = 0; i < this.length; i++) {
        if(this[i] in sumHash) {
            pairs.push([i, sumHash[this[i]]].sort());
        }
        else {
            sumHash[0 - this[i]] = i;
        }
    }
    return pairs;
};

Array.prototype.transpose = function() {
    let newMatrix = [];

    for(let i = 0; i < this.length; i++) {
        let newRow = [];
        for(let j = 0; j < this[i].length; j++) {
            newRow.push(this[j][i]);
        }
        newMatrix.push(newRow);
    }
    
    return newMatrix;
};