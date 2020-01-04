import * as APIUtil from './../util/session_api_util';

export const receiveCurrentUser = user => {
    return({
        type: "RECEIVE_CURRENT_USER",
        user
    });
};

export const logoutCurrentUser = () => {
    return ({
        type: "LOGOUT_CURRENT_USER"
    });
};

export const receiveErrors = errors => {
    return ({
        type: "RECEIVE_ERRORS",
        errors
    });
};

export const receiveSessionErrors = errors => {
    return ({
        type: "RECEIVE_SESSION_ERRORS",
        errors
    });
};

export const login = user => dispatch => (
    APIUtil.login(user).then(
        currentUser => dispatch(receiveCurrentUser(currentUser)),
        errors => dispatch(receiveErrors(errors)))
);

export const logout = () => dispatch => (
    APIUtil.logout().then(
        () => dispatch(logoutCurrentUser()),
        errors => dispatch(receiveErrors(errors)))
);

export const signup = user => dispatch => (
    APIUtil.signup(user).then(
        newUser => dispatch(receiveCurrentUser(newUser)),
        errors => dispatch(receiveErrors(errors)))
);

export const RECEIVE_CURRENT_USER = 'RECEIVE_CURRENT_USER';
export const LOGOUT_CURRENT_USER = 'LOGOUT_CURRENT_USER';
export const RECEIVE_ERRORS = 'RECEIVE_ERRORS';
export const RECEIVE_SESSION_ERRORS = 'RECEIVE_SESSION_ERRORS';