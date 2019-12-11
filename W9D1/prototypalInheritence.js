Function.prototype.inherits = function(superClass) {
    function Surrogate() {};
    Surrogate.prototype = superClass.prototype;
    this.prototype = new Surrogate();
    this.prototype.constructor = this;
}

function MovingObject() {
}

MovingObject.prototype.print = function() {
    console.log("hellor");
}



function Ship() {
}
Ship.inherits(MovingObject);


function Asteroid() {}
Asteroid.inherits(MovingObject);

const a = new Asteroid();
a.print();