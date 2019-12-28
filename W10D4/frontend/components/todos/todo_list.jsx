import React from 'react';
import TodoListItem from './todo_list_item';
import TodoForm from './todo_form';

const TodoList = (props) => (
    <div className="todo-list">
        <div className="todos-list">
            <h1>All your Todos:</h1>
            <ul className="todo-ul">
                {
                    props.todos.map((todo,idx) => <TodoListItem key={idx} todo={todo} receiveTodo={props.receiveTodo} removeTodo={props.removeTodo} />)
                }
            </ul>
        </div>
        <TodoForm receiveTodo={props.receiveTodo} />
    </div>
)

export default TodoList;