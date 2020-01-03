import React from 'react';

class Signup extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            username: '',
            email: '',
            password: ''
        }
    }

    handleInput(type) {
        return e => {
            this.setState({ [type]: e.target.value});
        };
    }

    handleSubmit(e) {
        e.preventDefault();
        this.props.createNewUser(this.state)
            .then(())
    }

    render() {
        return (
            <div className="">
                <h1>Sign up!</h1>
                <form>
                    <label htmlFor="username">Username:</label>
                    <input type="text" id="username" />
                </form>
            </div>
        );
    }
}

export default Signup;