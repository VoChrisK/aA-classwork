import React from "react";
import ReactDOM from "react-dom";
import Root from "./components/root";
import { configureStore } from "./store/store";

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("content");
  const store = configureStore();
  window.store = store;
  console.log(window.store.getState());
  ReactDOM.render(<Root store={store} />, root);
});
