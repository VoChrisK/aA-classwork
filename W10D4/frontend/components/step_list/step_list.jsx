import React from 'react';
import StepListItemContainer from './step_list_item_container';
import StepForm from './step_form';

const StepList = ({ todoId, steps, receiveStep }) => (
    <div className="step-list">
        <ul>
            {
                steps.map((step, idx) => <StepListItemContainer key={idx} step={step} />)

            }
        </ul>
        <StepForm receiveStep={receiveStep} todoId={todoId} />
    </div>
);


export default StepList;