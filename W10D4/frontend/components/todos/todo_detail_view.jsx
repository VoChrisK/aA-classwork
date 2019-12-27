import React from 'react';

class TodoDetailView extends React.Component {
    constructor(props) {
        super(props);
    }

    render() {
        return (
            <div className="todo-detail">
                <h1>{this.props.body}</h1>
                <button onClick={event => { this.props.removeTodo(todo) }}>Delete</button>
            </div>
        );
    }
}

export default TodoDetailView;