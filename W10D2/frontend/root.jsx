import React from "react";
import Clock from "./clock";
import Tab from "./tabs"
import Weather from "./weather";
import Autocomplete from "./autocomplete";

const Root = (props) => (
  <div className="widgets-container">
    <h1 className="widget-headers">Clock</h1>
    <Clock />
    <h1 className="widget-headers">Weather</h1>
    <Weather />
    <h1 className="widget-headers">Tabs</h1>
    <Tab title={["one", "two", "three"]} content={["I am the first", "Second pane here", "Third pane here"]} />
    <h1 className="widget-headers">Autocomplete</h1>
    <Autocomplete names={props.names} />
  </div>
)

export default Root;