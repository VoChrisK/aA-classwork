function Cat(name, owner) {
    this.name = name;
    this.owner = owner;
}

Cat.prototype.cuteStatement = function() {
    return `${this.name} loves ${this.owner}`
};

cat1 = new Cat("Autumn", "Chris");
cat2 = new Cat("Batcat", "Kevin");
cat3 = new Cat("Pirate", "Thomas");

console.log(cat1.cuteStatement());
console.log(cat2.cuteStatement());
console.log(cat3.cuteStatement());
console.log("-----------------------------------------");

Cat.prototype.cuteStatement = function () {
    return `Everybody loves ${this.name}!!!!`;
};

console.log(cat1.cuteStatement());
console.log(cat2.cuteStatement());
console.log(cat3.cuteStatement());
console.log("-----------------------------------------");

Cat.prototype.meow = function() {
    return "meeeeeow~";
};

console.log(cat1.meow());
console.log(cat2.meow());
console.log(cat3.meow());
console.log("-----------------------------------------");

cat1.meow = function() {
    return "nyaaaaa~";
}

console.log(cat1.meow());
console.log(cat2.meow());
console.log(cat3.meow());
