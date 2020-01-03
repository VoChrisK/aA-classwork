import { postUser, deleteSession, postSession } from './../utils/session';

const receiveCurrentUser = user => {
    type: "RECEIVE_CURRENT_USER",
    user
};

const logoutCurrentUser = () => {
    type: "LOGOUT_CURRENT_USER"
};

export const createNewUser = dispatch => ({
    createNewUser: user => postUser(user).then(newUser => dispatch(receiveCurrentUser(newUser)))
});

export const login = dispatch => ({
    login: user => postSession(user).then(currentUser => dispatch(receiveCurrentUser(currentUser)))
});

export const logout = dispatch => ({
    logout: () => deleteSession().then(() => dispatch(logoutCurrentUser()))
});

export const RECEIVE_CURRENT_USER = "RECEIVE_CURRENT_USER";
export const LOGOUT_CURRENT_USER = "LOGOUT_CURRENT_USER";