import { log } from "util";

const resizeBackground = () => {
    const todoList = document.getElementsByClassName("todo-list")[0];
    const background = document.getElementsByClassName("background")[0];
    if (todoList.offsetHeight > background.offsetHeight) {
        background.style.height = todoList.offsetHeight.toString() + "px";
    }
}

export default resizeBackground;