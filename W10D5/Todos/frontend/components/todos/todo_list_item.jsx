import React from 'react';

class TodoListItem extends React.Component {
  constructor(props) {
    super(props);
    this.updateStatus = this.updateStatus.bind(this);
  }

  updateStatus() {
    const newProps = Object.assign({}, this.props.todo);
    newProps.done = !newProps.done;
    this.props.receiveTodo(newProps);
  }

  render() {
    return (
      <div className="todo-list-item">
          <button onClick={this.updateStatus}>Done</button>
          <li>Title: {this.props.todo.title}</li>
          <button onClick={() => { this.props.removeTodo(this.props.todo) }}>Delete Todo</button>
          <h4>Done: {this.props.todo.done ? "Yes" : "No"}</h4>
      </div>
    )
  }
}

export default TodoListItem;