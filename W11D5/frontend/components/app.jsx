import React from 'react';
import { AuthRoute } from './../util/route_util';
import GreetingContainer from './greeting/greeting_container';
import LoginFormContainer from './session/login_form_container';
import SignupFormContainer from './session/signup_form_container';

const App = () => {
    return (
        <div>
            <header>
                <h1>Bench BnB</h1>
                <GreetingContainer />
            </header>

            <AuthRoute path="/login" component={LoginFormContainer} />
            <AuthRoute path="/signup" component={SignupFormContainer} />
        </div>
    );
};

export default App;