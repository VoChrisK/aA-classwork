import { connect } from 'react-redux';
import { login } from './../../actions/session_actions';
import SessionForm from './session_form';

const mapStateToProps = (state) => ({
  errors: state.errors,
  formType: 'login'
});

const mapDispatchToProps = (dispatch) => ({
  processForm: newUser => dispatch(login(newUser))
});

export default connect(mapStateToProps, mapDispatchToProps)(SessionForm);