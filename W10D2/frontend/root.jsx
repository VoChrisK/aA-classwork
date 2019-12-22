import React from "react";
import Clock from "./clock";
import Tab from "./tabs"
import Weather from "./weather";

const Root = (props) => (
  <div>
    <div>
      <Clock />
    </div>
    <div>
      <Tab title={["one", "two", "three"]} content={["I am the first", "Second pane here", "Third pane here"]} />
    </div>
    <div>
      <Weather />
    </div>
  </div>
)

export default Root;