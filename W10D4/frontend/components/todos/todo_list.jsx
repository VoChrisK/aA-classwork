import React from 'react';
import TodoListItem from './todo_list_item';
import TodoForm from './todo_form';

class TodoList extends React.Component {
    constructor(props) {
        super(props);
    }

    render() {
        return (
            <div className="todo-list">
                <ul className="todo-ul">
                    {
                        this.props.todos.map((todo,idx) => <TodoListItem key={idx} todo={todo} receiveTodo={this.props.receiveTodo} removeTodo={this.props.removeTodo} />)
                    }
                </ul>
                <TodoForm receiveTodo={this.props.receiveTodo} />
            </div>
        )
    }
}

export default TodoList;