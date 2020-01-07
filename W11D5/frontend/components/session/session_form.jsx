import React from 'react';
import { Link } from 'react-router-dom';
import uniqueId from './../../util/unique_id';

class SessionForm extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            username: "",
            password: ""
        };
    }

    handleUsername(e) {
        this.setState({username: e.target.value});
    }

    handlePassword(e) {
        this.setState({ password: e.target.value });
    }

    handleSubmit(e) {
        e.preventDefault();
        const user = Object.assign({}, this.state);
        user["id"] = uniqueId();
        this.props.processForm(user);
        this.setState({username: "", password: ""});
    }

    render() {
        const { formType, errors } = this.props

        return(
            <div className="session-form">
                <h1>{formType === "signup" ? "Sign Up" : "Log In"}</h1>
                <Link to={formType === "signup" ? "/login" : "/signup"}>{formType === "signup" ? "Log In" : "Sign Up"}</Link>

                <form className="input-info" onSubmit={this.handleSubmit.bind(this)}>
                    <label htmlFor="username">Username: </label>
                    <input type="text" id="username" value={this.state.username} onChange={this.handleUsername.bind(this)}/>
                    <label htmlFor="password">Password: </label>
                    <input type="password" id="password" value={this.state.password} onChange={this.handlePassword.bind(this)} />
                    <input type="submit" value={formType === "signup" ? "Sign Up" : "Log In"}/>
                </form>
                {errors.length > 0 ? <h1>{errors}</h1> : "" }
            </div>
        );
    }
}

export default SessionForm;
