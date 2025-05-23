// //TO DO VIEW: responsible for UI

// //use BlocBuilder

// import 'package:daily_reminder/data/todo.dart';
// import 'package:daily_reminder/presentation/todo_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:provider/provider.dart';

// class TodoView extends StatelessWidget {
//   const TodoView({super.key});

//   void _showAddTodoBox(BuildContext context) {
//     final todoCubit = context.read<TodoCubit>();
//     final textController = TextEditingController();
//     showDialog(
//       context: context,
//       builder:
//           (context) => AlertDialog(
//             content: TextField(controller: textController),
//             actions: [
//               //cancel button
//               TextButton(
//                 onPressed: () => Navigator.of(context).pop(),
//                 child: Text("Cancel"),
//               ),

//               //add button
//               TextButton(
//                 onPressed: () {
//                   todoCubit.addTodo(textController.text);
//                   Navigator.of(context).pop();
//                 },
//                 child: Text("Add"),
//               ),
//             ],
//           ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {

//     //todo cubit
//     final todoCubit=context.read<TodoCubit>();

//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add),
//         onPressed: () => _showAddTodoBox(context),
//       ),

//       //BlocBuilder
//       body: BlocBuilder<TodoCubit,List<Todo>>(
//         builder:(context,todos){

//           //Listview
//           return ListView.builder( itemCount: todos.length, itemBuilder: (context,index){
//             //get individual todo from todos list
//             final todo=todos[index];
//  //List Tile UI
//  return ListTile(
//   title: Text(todo.text),

//   //check box
//   leading: Checkbox(value: todo.iscompleted, onChanged: (value)=>todoCubit.toggleCompletion(todo),
//   ),

//   //delect button
//   trailing: IconButton(onPressed: ()=>todoCubit.delecteTodo(todo), icon: Icon(Icons.delete)),

//  );

//           });
//         } ),
//     );
//   }
// }
