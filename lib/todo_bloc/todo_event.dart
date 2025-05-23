import '../data/todo.dart';

abstract class TodoEvent {}

class AddTodo extends TodoEvent {
  final Todo todo;
  AddTodo(this.todo);
}

class DeleteTodo extends TodoEvent {
  final Todo todo;
  DeleteTodo(this.todo);
}

class ToggleTodoStatus extends TodoEvent {
  final Todo todo;
  ToggleTodoStatus(this.todo);
}

class TodoStarted extends TodoEvent {}

class EditTodo extends TodoEvent { // ✅ ADD THIS
  final Todo updatedTodo;
  EditTodo(this.updatedTodo);
}
