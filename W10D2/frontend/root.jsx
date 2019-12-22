import React from "react";
import Clock from "./clock";
import Tab from "./tabs"
import Weather from "./weather";

const Root = (props) => (
  <div className="widgets-container">
    <h1 className="widget-headers">Clock</h1>
    <div className="clock-widget widgets">
      <Clock />
    </div>
    <h1 className="widget-headers">Weather</h1>
    <div className="weather-widget widgets">
      <Weather />
    </div>
    <h1 className="widget-headers">Tabs</h1>
    <div className="tab-widget widgets">
      <Tab title={["one", "two", "three"]} content={["I am the first", "Second pane here", "Third pane here"]} />
    </div>
  </div>
)

export default Root;