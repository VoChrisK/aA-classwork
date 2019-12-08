function Student(fname, lname) {
    this.fname = fname;
    this.lname = lname;
    this.courses = [];
}

Student.prototype.name = function() {
    return fname + " " + lname;
};

Student.prototype.enroll = function(course) {
    if(!course.students.includes(this)) {
        if(this.hasConflict(course)) {
            throw "The course you are trying to add conflicts with your schedule!"
        } else {
            this.courses.push(course);
            course.addStudent(this);
        }
    }
};

Student.prototype.hasConflict = function(course) {
    for(let i = 0; i < this.courses.length; i++) {
        if(course.conflictsWith(this.courses[i])) return true;
    }

    return false;
};

Student.prototype.courseLoad = function () {
    let courseLoad = {};
    this.courses.forEach(course => courseLoad[course.department] = course.numCredits);
    return courseLoad;
}

function Course(name, department, numCredits, days, timeBlock) {
    this.name = name;
    this.department = department;
    this.numCredits = numCredits;
    this.students = [];
    this.days = days;
    this.timeBlock = timeBlock;
}

Course.prototype.addStudent = function(student) {
    this.students.push(student);
};

Course.prototype.conflictsWith = function(course) {
    if(this.timeBlock === course.timeBlock) {
        for(let i = 0; i < this.days.length; i++) {
            if(course.days.includes(this.days[i])) { 
                return true;
            }
        }
    }

    return false;
};

let cs101 = new Course("Intro to CS", "Computer Science", 5, ['mon', 'wed', 'fri'], 1);
let math142 = new Course("Combinatorics", "Mathematics", 5, ['tues', 'thurs'], 4);
let cs146 = new Course("Data Structures and Algorithms", "Computer Science", 5, ['mon', 'tues', 'thurs'], 1);
let chris = new Student("Chris", "Vo");
chris.enroll(cs101);
chris.enroll(math142);
chris.enroll(cs101);