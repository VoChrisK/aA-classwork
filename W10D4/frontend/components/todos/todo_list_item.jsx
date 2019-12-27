import React from 'react';
import TodoDetailView from './todo_detail_view';

class TodoListItem extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            detail: false
        };
    }

    updateTodo() {
        const updatedTodo = Object.assign({}, this.props.todo);
        updatedTodo.done = !updatedTodo.done;
        receiveTodo(updatedTodo);
    }

    showDetails(event) {
        event.preventDefault();
        this.setState({detail: !this.state.detail});
    }
    
    render() {
        return (
            <div className="todo-items">
                <div className="todo-list-item">
                    <li onClick={this.showDetails.bind(this)}>Title: {this.props.todo.title}</li>
                    <button onClick={this.updateTodo.bind(this)}>{this.props.todo.done ? "Done" : "Undo"}</button>
                </div>
                {this.state.detail ? <TodoDetailView todo={this.props.todo} /> : ""}
            </div>
        );
    }
};

export default TodoListItem;