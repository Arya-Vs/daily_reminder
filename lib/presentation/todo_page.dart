// // use Bloc Provider

// import 'package:daily_reminder/domain/repository.dart';
// import 'package:daily_reminder/presentation/todo_cubit.dart';
// import 'package:daily_reminder/presentation/todo_view.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class TodoPage extends StatelessWidget {
//   final TodoRep todoRep;
//   const TodoPage({super.key,required this.todoRep});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(create: (context)=>TodoCubit(todoRep),
//     child: TodoView(),
//     );
//   }
// }