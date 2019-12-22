const allTodos = (state) => {
  let todos = state.todos;
  // let todosArr = new Array(state.todos.length);
  return Object.keys(todos).map(key => { //do .sort() later to sort keys
    //if you do todosArr[key] instead, your index 
    //0 will be undefined and you will have an array of length 3
    return todos[key]; 
  });
}

export default allTodos;