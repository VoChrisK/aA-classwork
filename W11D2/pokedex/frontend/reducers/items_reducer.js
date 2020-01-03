const itemsReducer = (state = {}, action) => {
    Object.freeze(state);
    switch (action.type) {
        case RECEIVE_ALL_ITEMS:
            const nextState = Object.assign({}, action.items);
            return nextState;
        case RECEIVE_AN_ITEM:
            return action.item;
        default:
            return state;

    }
};

export default itemsReducer;