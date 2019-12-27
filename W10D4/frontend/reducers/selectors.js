export const allTodos = state => {
    const keys = Object.keys(state.todos);
    return keys.map(id => state.todos[id]);
};

export const stepsByTodoId = (state, todoId) => {
    const keys = Object.keys(state.steps);
    return keys.filter(step => step.todo_id === todoId);
};