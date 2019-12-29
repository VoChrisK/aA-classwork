import { connect } from 'react-redux';
import { receiveStep, removeStep } from './../../actions/step_actions';
import StepListItem from './step_list_item';

const mapStateToProps = (state, props) => ({
    step: props.step
});

const mapDispatchToProps = dispatch => ({
    receiveStep: step => dispatch(receiveStep(step)),
    removeStep: step => dispatch(removeStep(step))
});

export default connect(mapStateToProps, mapDispatchToProps)(StepListItem);