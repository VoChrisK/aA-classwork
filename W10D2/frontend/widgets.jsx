import React from "react";
import ReactDOM from "react-dom";
import Root from "./root";

const listOfNames = ["Abel", "Adam", "Akhtam", "Alex", "Anne", "Aya", "Barrett", "Benjamin", "Brian", "Carina", "Chi", "Chris", "Cody", "Dan", "Darryl", "David", "Duke", "Eddie", "Edward", "Elson", "Ethan", "Evans", "Frog", "Guanyao", "Han", "Helen", "Herman", "Ian", "JP", "Jan", "Jared", "Jaydip", "Johnson", "Jon", "Joseph", "Julie", "Julius", "Justin", "Kai", "Kenny", "Kevin", "Kit", "Kyle", "Linda", "Lex", "Macallan", "Manraj", "Margaret", "Martin", "Matthew", "Maya", "Micaela", "Michael", "Mohammed", "Morteza", "Nandhu", "Noel", "Oliver", "Phil", "Prescott", "Richard", "Sami", "Sarah", "Sebastian", "Tatiana", "Vince", "Wayne", "Yin"];

document.addEventListener("DOMContentLoaded", () => {
  const main = document.getElementById("main");
  ReactDOM.render(<Root names={listOfNames} />, main);
});