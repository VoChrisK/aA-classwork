Array.prototype.myEach = function(callback) {
    this.forEach(ele => callback(ele));
};

Array.prototype.myMap = function(callback) {
    let newArr = [];

    this.myEach(function(ele) {
        newArr.push(callback(ele));
    });

    return newArr;
}; 

Array.prototype.myReduce = function(callback, initialValue) {
    let sum;
    if(initialValue !== undefined) {
        sum = initialValue;
    }
    else {
        sum = this[0];
    }

    this.myEach(function(ele) {
        sum = callback(sum, ele);
    });

    if(initialValue === undefined) {
        sum -= this[0];
    }

    return sum;
};

console.log([1, 2, 3].myReduce(function (acc, el) {
    return acc + el;
})); // => 6

// with initialValue
console.log([1, 2, 3].myReduce(function (acc, el) {
    return acc + el;
}, 25)); // => 31