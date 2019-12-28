import React from 'react';
import uniqueId from './../../util/uniqueId';

class StepForm extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            title: "",
            done: false
        };
    }

    updateTitle(event) {
        event.preventDefault();
        this.setState({ title: event.target.value });
    }

    handleSubmit(event) {
        event.preventDefault();
        let newStep = Object.assign({}, this.state);
        newStep["todo_id"] = this.props.todoId;
        newStep["id"] = uniqueId();
        this.props.receiveStep(newStep);
        this.resetState();
    }

    resetState() {
        this.setState({title: "", done: false});
    }

    render() {
        return (
            <form className="step-form" onSubmit={this.handleSubmit.bind(this)}>
                <h1>Create New Step:</h1>
                <label htmlFor="step-title">Title</label>
                <input type="text" id="step-title" onChange={this.updateTitle.bind(this)} value={this.state.title}/>
                <input type="submit" value="Add Step!"/>
            </form>
        );
    }
}

export default StepForm;