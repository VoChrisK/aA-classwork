import React from 'react';

const StepListItem = ({step, receiveStep, removeStep}) => {

    const updateStep = () => {
        let updatedStep = Object.assign({}, step);
        updatedStep.done = !updatedStep.done;
        receiveStep(updatedStep);
    };

    return (
        <li className="step-list-item">
            <h1 title={step.title}>{step.title}</h1>
            <div className="buttons">
                <button onClick={event => {removeStep(step)}}>Delete Step</button>
                <button onClick={updateStep}>{step.done ? "Done" : "Undo"}</button>
            </div>
        </li>
    );
}

export default StepListItem;