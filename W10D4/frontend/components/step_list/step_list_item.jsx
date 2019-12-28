import React from 'react';

const StepListItem = ({step, receiveStep, removeStep}) => {

    const updateStep = () => {
        let updatedStep = Object.assign({}, step);
        updatedStep.done = !updatedStep.done;
        receiveStep(updatedStep);
    };

    return (
        <div className="step-list-item">
            <h1>{step.title}</h1>
            <button onClick={event => {removeStep(step)}}>Delete Step</button>
            <button onClick={updateStep}>{step.done ? "Done" : "Undo"}</button>
        </div>
    );
}

export default StepListItem;