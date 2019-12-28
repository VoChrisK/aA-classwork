import React from 'react';
import uniqueId from './../../util/uniqueId';

class TodoForm extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            title: "",
            body: "",
            done: false
        };

        this.updateTitle = this.updateTitle.bind(this);
        this.updateBody = this.updateBody.bind(this);
        this.addTodos = this.addTodos.bind(this);
    }

    addTodos(event) {
        event.preventDefault();
        let newTodo = Object.assign({}, this.state);
        if(newTodo.title.length === 0) newTodo.title = "N/A"
        newTodo["id"] = uniqueId();
        this.props.receiveTodo(newTodo);
        this.resetState();
    }

    updateTitle(event) {
        event.preventDefault();
        this.setState({title: event.target.value});
    }

    updateBody(event) {
        event.preventDefault();
        this.setState({body: event.target.value});
    }

    resetState() {
        this.setState({title: "", body: "", done: false});
    }

    render() {
        return (
            <form className="todo-form" onSubmit={this.addTodos}>
                <h1>Create new Todo:</h1>
                <div className="todo-title"> 
                    <label htmlFor="title">Title</label>
                    <input type="text" id="title" onChange={this.updateTitle} value={this.state.title}/>
                </div>
                <div className="todo-body">
                    <label htmlFor="body">Body</label>
                    <textarea id="body" onChange={this.updateBody} value={this.state.body}></textarea>
                </div>
                <input type="submit" value="Add Todo!" className="todo-submit"/>
            </form>
        );
    }
}

export default TodoForm;