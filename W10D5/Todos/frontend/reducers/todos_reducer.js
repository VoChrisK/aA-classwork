import RECEIVE_TODOS from "../actions/todo_actions";
import RECEIVE_TODO from "../actions/todo_actions";

const initialState = {
  1: {
    id: 1,
    title: "wash car",
    body: "with soap",
    done: false
  },
  2: {
    id: 2,
    title: "wash dog",
    body: "with shampoo",
    done: true
  }
};

//state will default to empty array ([]) in arguments
const todosReducer = (state = initialState, action) => {
  Object.freeze(state);
  const nextState = Object.assign({}, state);

  switch(action.type) {
    case "RECEIVE_TODOS":
      return convertArray({}, action.todos);
    case "RECEIVE_TODO":
      nextState[action.todo.id] = action.todo;
      return nextState;
    case "REMOVE_TODO":
      delete nextState[action.todo.id];
      return nextState;
    default:
      return state;
  }
};

const convertArray = (nextState, todos) => {
  for(let i = 0; i < todos.length; i++) {
    nextState[todos[i].id] = todos[i];
  }

  return nextState;
}

export default todosReducer;