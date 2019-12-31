const thunkMiddleware = (store) => {
    return next => {
        return action => {
            if (typeof action === "function") {
                return action(store.dispatch);
            } else {
                return next(action);
            };
        };
    };
};


export default thunkMiddleware;