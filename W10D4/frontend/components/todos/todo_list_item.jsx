import React from 'react';

const TodoListItem = ({todo, receiveTodo, removeTodo}) => {

    const updateTodo = () => {
        const updatedTodo = Object.assign({}, todo);
        updatedTodo.done = !updatedTodo.done;
        receiveTodo(updatedTodo);
    }
    
    return (
        <div className="todo-list-item">
            <li>Title: {todo.title}</li>
            <button onClick={event => {removeTodo(todo)}}>Delete</button>
            <button onClick={updateTodo}>{todo.done ? "Done" : "Undo"}</button>
        </div>
    );
};

export default TodoListItem;