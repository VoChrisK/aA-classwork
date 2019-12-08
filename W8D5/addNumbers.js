const readline = require('readline');

const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

const addNumbers = (sum, numsLeft, completionCallback) => {
    if(numsLeft === 0) {
        completionCallback(sum);
        reader.close();
        return;
    }

    reader.question('Please enter a number: ', (res) => {
        sum += parseInt(res);
        console.log(`Partial Sum: ${sum}`);
        addNumbers(sum, numsLeft - 1, completionCallback);
    });
};

addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));