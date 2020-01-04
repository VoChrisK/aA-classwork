import { connect } from 'react-redux';
import { signup } from './../../actions/session_actions';
import SessionForm from './session_form';

const mapStateToProps = (state) => ({
  errors: state.errors,
  formType: 'signup'
});

const mapDispatchToProps = (dispatch) => ({
  processForm: newUser => dispatch(signup(newUser))
});

export default connect(mapStateToProps, mapDispatchToProps)(SessionForm);

// From mapStateToProps(state, ownProps):
// errors(array) - list of errors from the state
// formType(string): 'login' or 'signup', for each respective container
// From mapDispatchToProps(dispatch, ownProps):
// processForm(function): dispatching action creators login or signup, again depending on the container