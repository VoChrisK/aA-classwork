import { get } from "http";

export const fetchTodos = () => {
  return $.ajax({
    url: 'api/todos',
    method: 'get'
  });
}
