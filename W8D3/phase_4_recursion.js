const range = (start,end) => {
    if(start === end) return start;
    return [start].concat(range(start+1,end));
};

const sumRec = (arr) => {
    if(arr.length === 0) {
        return 0;
    }

    if(arr.length === 1) {
        return arr[0];
    }

    return sumRec(arr.slice(1, arr.length)) + arr[0];
};

const exponent = (base, exp) => {
    if(exp === 0) {
        return 1;
    }

    if(exp === 1) {
        return base;
    }

    return exponent(base, exp-1) * base;
};

const exponentV2 = (base, exp) => {
    if(exp === 0) {
        return 1;
    }
    if(exp === 1) {
        return base;
    }
    if(exp % 2 === 0) {
        return Math.pow(exponentV2(base, exp / 2), 2);
    } else {
        return base * Math.pow((exponentV2(base, (exp - 1) / 2)), 2);
    }
    
};

const fibbonacci = (n) => {
    if(n <= 0) return [];

    if(n === 1) {
        return [1];
    }

    if(n === 2) {
        return [1,1];
    }

    let newArr = fibbonacci(n-1);
    newArr.push(newArr[newArr.length - 1] + newArr[newArr.length - 2]);
    return newArr;
};

const deepDup = function(arr) {
    let newArr = [];
    for(let i = 0; i < arr.length; i++) {
        if(Array.isArray(arr[i])) {
            newArr.push(deepDup(arr[i]));
        } else {
            newArr.push(arr[i]);
        }
    }

    return newArr.slice(0);
};

const bsearch = function(arr, target) {
    if(arr.length === 0) return -1;

    let mid = Math.floor(arr.length / 2);
    if(arr[mid] === target) {
        return mid;
    } else if(arr[mid] > target) {
        return bsearch(arr.slice(0, mid), target);
    } else {
        const right = bsearch(arr.slice(mid+1), target);
        return right === -1 ? -1 : (right + mid + 1);
    }
}

function merge(left, right) {
    let merged = [];
    while(left.length > 0 && right.length > 0) {
        if(left[0] > right[0]) {
            merged.push(right[0]);
            right.shift();
        } else {
            merged.push(left[0]);
            left.shift();
        }
    }
    return merged.concat(left, right);
}

const mergesort = function(arr) {
    if(arr.length > 1) {
        let mid = Math.floor(arr.length / 2);
        let left = mergesort(arr.slice(0, mid));
        let right = mergesort(arr.slice(mid, arr.length));
        return merge(left, right);
    }

    return arr;
}

const subsets = function(arr) {
    if(arr.length === 0) {
        return [[]];
    }

    let subsetsArr = subsets(arr.slice(0, arr.length - 1));
    let length = subsetsArr.length;
    for(let i = 0; i < length; i++) {
        let temp = subsetsArr[i].slice(0, subsetsArr[i].length);
        temp.push(arr[arr.length - 1]);
        subsetsArr.push(temp);
    }
    return subsetsArr;
}