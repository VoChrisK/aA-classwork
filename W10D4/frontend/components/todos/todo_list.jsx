import React from 'react';
import TodoListItem from './todo_list_item';
import TodoForm from './todo_form';

const listTodos = (props) => {
  return (
    <div>
      <h1>All the todos here!</h1>
      <ul>
        {
          props.todos.map(todo => <TodoListItem todo={todo} key={todo.id} />)
        }
      </ul>
      <br />
      {
        <ToDoForm receiveTodo={receiveTodo} />
      }
    </div>
  );
}

export default listTodos;