import React from 'react';

class TodoForm extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <form onSubmit={e => {this.props.receiveTodo(e.currentTarget.)}}>
        <label>
          Add a todo:
          <input type="text" />
          <input type="submit" value="Add todo"/>
        </label>
      </form>
    )
  }
}

export default TodoForm;