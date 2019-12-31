import * as TodoApiUtils from './../util/todo_api_util';
import { receiveErrors } from './error_actions';

export const receiveTodos = todos => ({
    type: "RECEIVE_TODOS",
    todos
});

export const receiveTodo = todo => ({
    type: "RECEIVE_TODO",
    todo
});

export const removeTodo = todo => ({
    type: "REMOVE_TODO",
    todo
});

export const fetchTodos = () => dispatch => {
    return TodoApiUtils.fetchTodos().then(todos => dispatch(receiveTodos(todos)));
};

export const createTodo = todo => dispatch => {
    console.log(TodoApiUtils.createTodo(todo).then(
        () => dispatch(receiveTodo(todo))).fail(errors => dispatch(receiveErrors(errors))));
    return TodoApiUtils.createTodo(todo).then(
        () => dispatch(receiveTodo(todo))).fail(errors => dispatch(receiveErrors(errors)));
};

export const updateTodo = todo => dispatch => {
    return TodoApiUtils.updateTodo(todo).then(
        () => dispatch(receiveTodo(todo)),
        errors => dispatch(receiveErrors(errors))
    );
};

export const deleteTodo = todo => dispatch => {
    return TodoApiUtils.deleteTodo(todo).then(
        () => dispatch(removeTodo(todo)),
        errors => dispatch(receiveErrors(errors))
    );
}

window.fetchTodos = fetchTodos;

export const RECEIVE_TODOS = "RECEIVE_TODOS";
export const RECEIVE_TODO = "RECEIVE_TODO";
export const REMOVE_TODO = "REMOVE_TODO";