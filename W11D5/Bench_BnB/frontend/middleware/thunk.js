const thunkMiddleware = store => next => action => {
    if (typeof action === "function") {
        return action(store.dispatch, store.getState);
    } else if (typeof action === "object") {
        return next(action);
    }
};


export default thunkMiddleware;