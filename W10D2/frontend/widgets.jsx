import React from "react";
import ReactDOM from "react-dom";
import Root from "./root";

const listOfNames = ["Abel", "Brian", "Carina", "Chris", "Elson", "Evans", "Julius", "Lex", "Macallan", "Sarah"];

document.addEventListener("DOMContentLoaded", () => {
  const main = document.getElementById("main");
  ReactDOM.render(<Root names={listOfNames} />, main);
});