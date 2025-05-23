import 'package:flutter_bloc/flutter_bloc.dart';
import 'todo_event.dart';
import 'todo_state.dart';
import 'package:daily_reminder/data/todo.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(const TodoLoadSuccess([])) {  // initial state is empty list
    on<AddTodo>((event, emit) {
      if (state is TodoLoadSuccess) {
        final currentState = state as TodoLoadSuccess;
        final updatedTodos = List<Todo>.from(currentState.todos)..add(event.todo);
        emit(currentState.copyWith(todos: updatedTodos));
      }
    });

    on<ToggleTodoStatus>((event, emit) {
      if (state is TodoLoadSuccess) {
        final currentState = state as TodoLoadSuccess;
        final updatedTodos = currentState.todos.map((todo) {
          return todo.id == event.todo.id
              ? todo.copyWith(isCompleted: !todo.isCompleted)
              : todo;
        }).toList();
        emit(currentState.copyWith(todos: updatedTodos));
      }
    });

    on<DeleteTodo>((event, emit) {
      if (state is TodoLoadSuccess) {
        final currentState = state as TodoLoadSuccess;
        final updatedTodos = currentState.todos.where((todo) => todo.id != event.todo.id).toList();
        emit(currentState.copyWith(todos: updatedTodos));
      }
    });

    on<EditTodo>((event, emit) {
  if (state is TodoLoadSuccess) {
    final updatedTodos = (state as TodoLoadSuccess).todos.map((todo) {
      return todo.id == event.updatedTodo.id ? event.updatedTodo : todo;
    }).toList();
    emit(TodoLoadSuccess(updatedTodos));
  }
});

  }
}
