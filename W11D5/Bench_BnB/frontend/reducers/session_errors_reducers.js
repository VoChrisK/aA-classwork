import { 
    RECEIVE_CURRENT_USER, 
    RECEIVE_SESSION_ERRORS 
} from "../actions/session_actions";

const sessionErrorsReducer = (state = {}, action) => {
    Object.freeze(state);
    let nextState;
    switch(action.type) {
        case RECEIVE_SESSION_ERRORS:
            nextState = Object.assign({}, state, {errors: action.errors });
            return nextState;
        case RECEIVE_CURRENT_USER:
            nextState = Object.assign({}, state);
            delete nextState.errors;
            return nextState;
        default:
            return state;
    }
};

export default sessionErrorsReducer;