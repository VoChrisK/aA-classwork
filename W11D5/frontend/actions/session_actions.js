import * as SessionApiUtil from './../util/session_api_util';

export const receiveCurrentUser = currentUser => {
    return ({
        type: "RECEIVE_CURRENT_USER",
        currentUser
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
}

export const signup = user => dispatch => {
    return SessionApiUtil.signup(user)
    .then(
        currentUser => dispatch(receiveCurrentUser(currentUser)),
        errors => dispatch(receiveErrors(errors.responseJSON))
    );
};

export const login = user => dispatch => {
    return SessionApiUtil.login(user)
    .then(
        currentUser => dispatch(receiveCurrentUser(currentUser)),
        errors => dispatch(receiveErrors(errors.responseJSON))
    );
};

export const logout = () => dispatch => {
    return SessionApiUtil.logout()
    .then(
        () => dispatch(logoutCurrentUser()),
        errors => dispatch(receiveErrors(errors.responseJSON))
    );
};

export const RECEIVE_CURRENT_USER = "RECEIVE_CURRENT_USER";
export const LOGOUT_CURRENT_USER = "LOGOUT_CURRENT_USER";
export const RECEIVE_ERRORS = "RECEIVE_ERRORS";