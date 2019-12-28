import React from 'react';
import StepListContainer from '../step_list/step_list_container';

class TodoDetailView extends React.Component {
    constructor(props) {
        super(props);
    }

    render() {
        return (
            <div className="todo-detail">
                <h1>{this.props.todo.body}</h1>
                <h1>Steps:</h1>
                <StepListContainer todo_id={this.props.todo.id}/>
                <button onClick={event => { this.props.removeTodo(this.props.todo) }}>Delete</button>
            </div>
        );
    }
}

export default TodoDetailView;