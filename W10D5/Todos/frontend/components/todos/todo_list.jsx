import React from 'react';
import TodoListItem from './todo_list_item';
import TodoForm from './todo_form';

const listTodos = (props) => {
  return (
    <div>
      <h1>All the todos here!</h1>
      <ul className="todo-list">
        {
          props.todos.map(todo => <TodoListItem receiveTodo={props.receiveTodo} removeTodo={props.removeTodo} todo={todo} key={todo.id} />)
        }
      </ul>
      <br />
      {
        <TodoForm receiveTodo={props.receiveTodo} />
      }
    </div>
  );
}

export default listTodos;