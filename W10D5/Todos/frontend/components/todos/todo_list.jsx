import React from 'react';
import TodoListItem from './todo_list_item';
import TodoForm from './todo_form';
import resizeBackground from './../../util/resizeBackground';

class TodoList extends React.Component {
    constructor(props) {
        super(props);
    }

    componentDidMount() {
        this.props.fetchTodos();
    }

    componentDidUpdate() {
        resizeBackground(); 
    }

    render() {
        return (
            <div className="todo-list">
                <div className="todos-list">
                    <h1>All your Todos:</h1>
                    <ul className="todo-ul">
                        {
                            this.props.todos.map((todo,idx) => <TodoListItem key={idx} todo={todo} receiveTodo={this.props.receiveTodo} removeTodo={this.props.removeTodo} updateTodo={this.props.updateTodo} />)
                        }
                    </ul>
                </div>
                <TodoForm receiveTodo={this.props.receiveTodo} createTodo={this.props.createTodo
                } />
            </div>
        )
    }
}

export default TodoList;