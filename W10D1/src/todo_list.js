let todos = [];
let temp = localStorage.getItem("todos");
if(temp !== ''){
  todos = JSON.parse(temp);
}
let formEl = document.getElementsByClassName("add-todo-form")[0];


function addToDo() {
  for(let i = 0; i < todos.length; i++) {
    // todo[i].done = 
    populateList(todos[i]);
  }
  formEl.addEventListener("submit", event => {
    let inputEl = document.getElementsByName("add-todo")[0];
    let todo = {
      "add-todo": "",
      "done": true
    };
    event.preventDefault();
    todo["add-todo"] = inputEl.value;
    let temp = populateList(todos[todos.length - 1]);
    localStorage.setItem("todos", JSON.stringify(todos));
    todos.push(temp);
    inputEl.value = "";
  });
}

function populateList(todo) {

    const labelEl = document.createElement("label");
    labelEl.innerHTML = todo["add-todo"];
    const inputEl = document.createElement("input");
    inputEl.setAttribute("type", "checkbox");
    inputEl.setAttribute("data", todo.done);
    inputEl.addEventListener("change", event => {
      todo.done = !event.target.done;
      // console.log(.done);
      // todos.forEach((ele)=>{
      //   if (ele === event.target){

      //   }
      // })
    });
    if(inputEl.checked === true){ inputEl.setAttribute('checked', true);}
    labelEl.appendChild(inputEl);
    const liEl = document.createElement("li");
    liEl.appendChild(labelEl);
    const ulEl = document.getElementsByClassName("todos")[0];
    ulEl.appendChild(liEl);
    return todo;
}



addToDo();

export { addToDo, populateList };