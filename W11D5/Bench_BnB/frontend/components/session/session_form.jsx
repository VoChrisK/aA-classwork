import React from 'react';

class SessionForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      username: "",
      password: ""
    };
  }

  handleSubmit(e) {
    e.preventDefault();
    const user = Object.assign({}, this.state);
    this.props.processForm(user);
    this.setState({username: "", password: ""});
  }

  handleUsername(e) {
    this.setState({ username: e.target.value });
  }

  handlePassword(e) {
    this.setState({ password: e.target.value });
  }

  render() {
    return (
      <form onSubmit={this.handleSubmit.bind(this)}>
        {
          this.props.formType === "signup" ? 
            <Route path="/login" /> :
            <Route path="/signup" />
        }
        {this.props.formType === "signup" ? <h2>Sign up</h2> : <h2>Log in</h2>}
        <label htmlFor="username">Username:</label>
        <input type="text" id="username" onChange={this.handleUsername.bind(this)} value={this.state.username}/>
        <label htmlFor="password">Password:</label>
        <input type="password" id="password" onChange={this.handlePassword.bind(this)} value={this.state.password} />
        <input type="submit" value={this.props.formType === "signup" ? "Sign Up" : "Log In"}/>
      </form>
    );
  }
}

export default SessionForm;