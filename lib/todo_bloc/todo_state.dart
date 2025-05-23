import 'package:equatable/equatable.dart';
import 'package:daily_reminder/data/todo.dart';

abstract class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

class TodoLoadSuccess extends TodoState {
  final List<Todo> todos;

  const TodoLoadSuccess(this.todos);

  TodoLoadSuccess copyWith({List<Todo>? todos}) {
    return TodoLoadSuccess(todos ?? this.todos);
  }

  @override
  List<Object> get props => [todos];
}
