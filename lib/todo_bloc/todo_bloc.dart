import 'package:bloc/bloc.dart';
import 'package:daily_reminder/data/todo.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends HydratedBloc<TodoEvent, TodoState> {
  TodoBloc() : super(const TodoState()) {
    on<TodoStarted>(_onStarted);
    on<AddTodo>(_onAddTodo);
    on<RemoveTodo>(_onRemoveTodo);
    on<AlterTodo>(_onAlterTodo);
  }

  void _onStarted(TodoStarted event, Emitter<TodoState> emit) {
    if (state.status == TodoStatus.success) return;
    emit(state.copywith(
      todos: state.todos,
      status: TodoStatus.success,
    ));
  }

  void _onAddTodo(AddTodo event, Emitter<TodoState> emit) {
    emit(state.copywith(status: TodoStatus.loading));
    try {
      final updatedTodos = List<Todo>.from(state.todos)..insert(0, event.todo);
      emit(state.copywith(todos: updatedTodos, status: TodoStatus.success));
    } catch (_) {
      emit(state.copywith(status: TodoStatus.error));
    }
  }

  void _onRemoveTodo(RemoveTodo event, Emitter<TodoState> emit) {
    emit(state.copywith(status: TodoStatus.loading));
    try {
      final updatedTodos = List<Todo>.from(state.todos)..remove(event.todo);
      emit(state.copywith(todos: updatedTodos, status: TodoStatus.success));
    } catch (_) {
      emit(state.copywith(status: TodoStatus.error));
    }
  }

  void _onAlterTodo(AlterTodo event, Emitter<TodoState> emit) {
    emit(state.copywith(status: TodoStatus.loading));
    try {
      final updatedTodos = List<Todo>.from(state.todos);
      final todo = updatedTodos[event.index];
      updatedTodos[event.index] = todo.copywith(isDone: !todo.isDone);
      emit(state.copywith(todos: updatedTodos, status: TodoStatus.success));
    } catch (_) {
      emit(state.copywith(status: TodoStatus.error));
    }
  }

  @override
  TodoState? fromJson(Map<String, dynamic> json) {
    return TodoState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(TodoState state) {
    return state.toJson();
  }
}
