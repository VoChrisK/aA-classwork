import { RECEIVE_TODOS, RECEIVE_TODO, REMOVE_TODO } from "./../actions/todo_actions";

const initialState = {
    1: {
        id: 1,
        title: "wash car",
        body: "I have to wash my car since I haven't washed it for 3 months already. I need to wash my car using a mixture of soap and water.",
        done: false
    },
    2: {
        id: 2,
        title: "wash dog",
        body: "My dog is long overdue for a bath after a month. The final straw was him playing in the mud when it was raining. Also wash him using the new shampoo I bought yesterday.",
        done: true
    }
};

const todosReducer = (state = initialState, action) => {
    Object.freeze(state);
    let nextState;
    switch(action.type) {
        case RECEIVE_TODOS:
            nextState = {};
            action.todos.forEach(todo => {
                nextState[todo.id] = todo;
            });
            return nextState;
        case RECEIVE_TODO:
            nextState = Object.assign({}, state);
            nextState[action.todo.id] = action.todo;
            return nextState;
        case REMOVE_TODO:
            nextState = Object.assign({}, state);
            delete nextState[action.todo.id];
            return nextState;
        default:
            return state;
    }
};

export default todosReducer;