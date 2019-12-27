import { connect } from 'react-redux';
import TodoList from './todo_list';
import allTodos from '../../reducers/selector';
import { receiveTodo } from './../../actions/todo_action'

const mapStateToProps = state => ({
    todos: allTodos(state)
});

const mapDispatchToProps = dispatch => ({
    receiveTodo: todo => dispatch(receiveTodo(todo))
})

const connectedComponent = connect(mapStateToProps, mapDispatchToProps);
const connectedComponentResults = connectedComponent(TodoList);

export default connectedComponentResults;

//or
//export default connect(mapStateToProps, mapDispatchToProps)(TodoList)