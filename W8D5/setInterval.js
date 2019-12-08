class Clock {
    constructor() {
        // 1. Create a Date object.
        // 2. Store the hours, minutes, and seconds.
        // 3. Call printTime.
        // 4. Schedule the tick at 1 second intervals.

        let date = new Date();
        this.hours = date.getHours();
        this.minutes = date.getMinutes();
        this.seconds = date.getSeconds();
        this.printTime();

        // What works:
        // setInterval(this._tick.bind(this), 1000);

        // setInterval(() => this._tick(), 1000); //ES6

        const that = this;
        setInterval(function() {
            that._tick();
        }, 1000);

        // What does not work:
        // setInterval(function() {
        //      this._tick();
        //}, 1000);
        //^^^ setInterval is invoking the anonymous closure function style and resets context of this to global/window context.
    }

    printTime() {
        // Format the time in HH:MM:SS
        // Use console.log to print it.

        let format = "";
        if(this.hours < 10) {
            format += "0" + this.hours;
        } else {
            format += this.hours;
        }

        format += ":";

        if (this.minutes < 10) {
            format += "0" + this.minutes;
        } else {
            format += this.minutes;
        }

        format += ":";

        if (this.seconds < 10) {
            format += "0" + this.seconds;
        } else {
            format += this.seconds;
        }

        console.log(format);
    }

    _tick() {
        // 1. Increment the time by one second.
        // 2. Call printTime.

        this.seconds += 1;

        if(this.seconds >= 60) {
            this.seconds = 0;
            this.minutes += 1;
        }

        if(this.minutes >= 60) {
            this.minutes = 0;
            this.hours += 1;
        }

        if(this.hours >= 24) {
            this.hours = 0;
            this.minutes = 0;
            this.seconds = 0;
        }

        this.printTime();
    }
}

const clock = new Clock();