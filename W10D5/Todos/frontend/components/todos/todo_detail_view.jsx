import React from 'react';
import StepListContainer from '../step_list/step_list_container';

class TodoDetailView extends React.Component {
    constructor(props) {
        super(props);
    }

    render() {
        return (
            <div className="todo-detail">
                <p className="description"><strong>Description:</strong> {this.props.todo.body}</p>
                <StepListContainer todo_id={this.props.todo.id}/>
                <button onClick={event => { this.props.removeTodo(this.props.todo) }} className="delete-todo">Delete Todo</button>
            </div>
        );
    }
}

export default TodoDetailView;