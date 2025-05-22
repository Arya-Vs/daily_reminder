import 'package:daily_reminder/data/todo.dart';

abstract class TodoRep{
  // get list of todos

Future<List<Todo>>getTodos();

  // add a new todo
  Future<void>addTodo(Todo newTodo);

  // update an existing todo
  Future<void>updateTodo(Todo todo);

  //delecte a todo
  Future<void>delecteTodo(Todo todo);



}