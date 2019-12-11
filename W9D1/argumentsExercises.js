function sum() {
    let sum = 0;
    for(let i = 0; i < arguments.length; i++) {
        sum += arguments[i];
    }
    return sum;
}

function sumV2(...args) {
    let sum = 0;
    for(let i = 0; i < args.length; i++) {
        sum += args[i];
    }
    return sum;
}

// console.log(sumV2(1, 2, 3, 4) === 10);
// console.log(sumV2(1, 2, 3, 4, 5) === 15);

// Function.prototype.myBind = function(context) {
//     const that = this;
//     let myargs = Array.from(arguments);
//     return function() {
//         myargs = myargs.concat(Array.from(arguments));
//         myargs.shift();
//         that.apply(context, myargs);
//     }
// }

Function.prototype.myBind = function (context, ...args1) {

    return (...args) => {

        this.apply(context, args1.concat(args));
    }
}

class Cat {
    constructor(name) {
        this.name = name;
    }

    says(sound, person) {
        console.log(`${this.name} says ${sound} to ${person}!`);
        return true;
    }
}

class Dog {
    constructor(name) {
        this.name = name;
    }
}

const markov = new Cat("Markov");
const pavlov = new Dog("Pavlov");

// markov.says("meow", "Ned");
// Markov says meow to Ned!
// true

// bind time args are "meow" and "Kush", no call time args
// markov.says.myBind(pavlov, "meow", "Kush")();
// Pavlov says meow to Kush!
// true

// no bind time args (other than context), call time args are "meow" and "a tree"
// markov.says.myBind(pavlov)("meow", "a tree");
// Pavlov says meow to a tree!
// true

// bind time arg is "meow", call time arg is "Markov"
// markov.says.myBind(pavlov, "meow")("Markov");
// Pavlov says meow to Markov!
// true

// no bind time args (other than context), call time args are "meow" and "me"
// const notMarkovSays = markov.says.myBind(pavlov);
// notMarkovSays("meow", "me");
// Pavlov says meow to me!
// true

function curriedSum(n) {
    this.n = n;
    // let numbers = [];
    let sum = 0;
    const _curriedSum = function(ele) {
        // numbers.push(ele);
        sum += ele;
        n -= 1;
        if (n > 0) {
            return sum;
        } else {
            return _curriedSum;
        }
    };

    return _curriedSum;
}



function curriedSum2(n) {
    let total = 0;
    const func = function(el) {
        total += el;
        n -= 1;
        if(n > 0){
            return func;
        }else{
            return total;
        }
    }
    return func;
}

// const total = curriedSum2(4);
// console.log(total(5)(30)(20)(1)); // => 56

Function.prototype.curry = function(numArgs) {
    let allArgs = [];
    const funct = (arg) => {
        allArgs.push(arg);
        if(allArgs.length === numArgs) {
            this(...allArgs);
            // this.apply(this, allArgs);
            // this.call(this, ...allArgs);
        } else {
            return funct;
        }
    };

    return funct;
}

function sum(a, b){

    console.log( a + b );
}

function myobj(){
    const c = 1;
    const d =2;
}

let myCurrySum = sum.curry(2);
myCurrySum(1);
myCurrySum(2);
