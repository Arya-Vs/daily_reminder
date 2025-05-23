// import 'package:daily_reminder/data/todo.dart';
// import 'package:daily_reminder/domain/repository.dart';
// import 'package:hydrated_bloc/hydrated_bloc.dart';

// class TodoCubit extends Cubit<List<Todo>>{
// // Reference todo repo
//   late final TodoRep todoRepo;

// //  Constructor initialize the cubit with an emoty list
// TodoCubit(this.todoRepo):super([]){
//   loadTodos();
// }

// //LOAD

// Future<void>loadTodos()async{
//   final todoList=await todoRepo.getTodos();
//   //emit the fetched list as the new state
//   emit(todoList);
// }
// //ADD
// Future<void>addTodo(String Text)async{
//   //create a new todo with uniqe Id
//   final newTodo=Todo(
//     id:DateTime.now().microsecondsSinceEpoch,
//     text:text,
//   );

//   //save the new todo to repo
//   await todoRepo.addTodo(newTodo);

//   //re-load
//   loadTodos();

// }

// //DELETE

// Future<void>delecteTodo(Todo todo)async{
//   //delete the provided todo from repo
//   await todoRepo.delecteTodo(todo);

//   //re-load
//   loadTodos();
// }
// //TOGGLE
// Future<void>toggleCompletion(Todo todo)async{
//   //toggle the completion status of provided todo

//   final updateTodo=todo.toggleCompletion();
//   //update the todo in the repo with new comletion status
//   await todoRepo.updateTodo(updateTodo);
//   loadTodos();

// }
  
// }