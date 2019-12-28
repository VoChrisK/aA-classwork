import React from 'react';
import TodoListItem from './todo_list_item';
import TodoForm from './todo_form';

const TodoList = (props) => (
    <div className="todo-list">
        <ul className="todo-ul">
            {
                props.todos.map((todo,idx) => <TodoListItem key={idx} todo={todo} receiveTodo={props.receiveTodo} removeTodo={props.removeTodo} />)
            }
        </ul>
        <TodoForm receiveTodo={props.receiveTodo} />
    </div>
)

export default TodoList;