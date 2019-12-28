export const allTodos = state => {
    const keys = Object.keys(state.todos);
    return keys.map(id => state.todos[id]);
};

export const stepsByTodoId = (state, todoId) => {
    const keys = Object.keys(state.steps);
    const newSteps = [];
    keys.forEach(id => {
        if(state.steps[id].todo_id === todoId) newSteps.push(state.steps[id]);
    });
    return newSteps;
};