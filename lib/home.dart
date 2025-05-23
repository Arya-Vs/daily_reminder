// import 'package:daily_reminder/data/todo.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:uuid/uuid.dart';

// import '../auth/auth.dart';
// import '../drawer/drawer.dart';
// import '../todo_bloc/todo_bloc.dart';
// import '../todo_bloc/todo_event.dart';
// import '../todo_bloc/todo_state.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final User? user = Auth().currentUser;
//   final DateTime today = DateTime.now();
//   int _selectedIndex = 0;
//   int selectedDateIndex = 0;

//   final ValueNotifier<bool> scrollNotifier = ValueNotifier(true);
//   final TextEditingController _controller = TextEditingController();
//   final uuid = const Uuid();

//   Future<void> signOut() async {
//     await Auth().signOut();
//   }

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       if (user != null) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Welcome..!'),
//             backgroundColor: Colors.green,
//             duration: const Duration(seconds: 3),
//           ),
//         );
//       }
//     });
//   }

//   void _onItemTapped(int index) {
//     if (_selectedIndex != index) {
//       setState(() {
//         _selectedIndex = index;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: CustomDrawer(onSignOut: signOut),
//       body: ValueListenableBuilder<bool>(
//         valueListenable: scrollNotifier,
//         builder: (context, isVisible, _) {
//           return NotificationListener<UserScrollNotification>(
//             onNotification: (notification) {
//               final direction = notification.direction;
//               if (direction == ScrollDirection.reverse) {
//                 scrollNotifier.value = false;
//               } else if (direction == ScrollDirection.forward) {
//                 scrollNotifier.value = true;
//               }
//               return true;
//             },
//             child: Stack(
//               children: [
//                 ListView(
//                   padding: const EdgeInsets.only(top: kToolbarHeight + 10),
//                   children: [
//                     _buildHorizontalDateStrip(),
//                     const SizedBox(height: 20),
//                     Center(
//                       child: Text(
//                         'Your Tasks Appear Here',
//                         style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     _buildTodoInput(),
//                     _buildTodoList(),
//                     const SizedBox(height: 100),
//                   ],
//                 ),
//                 AnimatedPositioned(
//                   duration: const Duration(milliseconds: 200),
//                   top: isVisible ? 0 : -kToolbarHeight,
//                   left: 0,
//                   right: 0,
//                   child: AppBar(
//                     iconTheme: const IconThemeData(color: Colors.white),
//                     title: Text(
//                       user?.email ?? 'Welcome..',
//                       style: const TextStyle(fontSize: 11.0, color: Colors.white),
//                     ),
//                     backgroundColor: Colors.teal,
//                     actions: [
//                       IconButton(
//                         onPressed: () async {
//                           final selectedDate = await showDatePicker(
//                             context: context,
//                             initialDate: today,
//                             firstDate: DateTime(2000),
//                             lastDate: DateTime(2100),
//                           );
//                           if (selectedDate != null) {
//                             setState(() {
//                               selectedDateIndex = selectedDate.difference(today).inDays;
//                             });
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               SnackBar(
//                                 content: Text("Selected: ${selectedDate.toLocal()}"),
//                                 duration: const Duration(seconds: 2),
//                               ),
//                             );
//                           }
//                         },
//                         icon: const Icon(Icons.calendar_today, size: 20.0),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.teal,
//         unselectedItemColor: Colors.grey,
//         onTap: _onItemTapped,
//         type: BottomNavigationBarType.fixed,
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//           BottomNavigationBarItem(icon: Icon(Icons.task), label: 'Tasks'),
//           BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Health'),
//           BottomNavigationBarItem(icon: Icon(Icons.analytics_outlined), label: 'Dashboard'),
//           BottomNavigationBarItem(icon: Icon(Icons.flag), label: 'Weekly Goals'),
//         ],
//       ),
//     );
//   }

//   Widget _buildHorizontalDateStrip() {
//     return SizedBox(
//       height: 90,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: 7,
//         itemBuilder: (context, index) {
//           final date = today.add(Duration(days: index));
//           final isSelected = index == selectedDateIndex;

//           return GestureDetector(
//             onTap: () {
//               setState(() {
//                 selectedDateIndex = index;
//               });
//             },
//             child: Container(
//               width: 60,
//               margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
//               decoration: BoxDecoration(
//                 color: isSelected ? Colors.blue : Colors.white,
//                 borderRadius: BorderRadius.circular(12),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.shade300,
//                     blurRadius: 4,
//                     offset: const Offset(2, 2),
//                   ),
//                 ],
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'][date.weekday % 7],
//                     style: TextStyle(
//                       fontSize: 12,
//                       fontWeight: FontWeight.w600,
//                       color: isSelected ? Colors.white : Colors.black,
//                     ),
//                   ),
//                   const SizedBox(height: 4),
//                   Text(
//                     '${date.day}',
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                       color: isSelected ? Colors.white : Colors.black,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildTodoInput() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
//       child: Row(
//         children: [
//           Expanded(
//             child: TextField(
//               controller: _controller,
//               decoration: const InputDecoration(hintText: "Enter todo"),
//             ),
//           ),
//           IconButton(
//             icon: const Icon(Icons.add),
//             onPressed: () {
//               if (_controller.text.trim().isNotEmpty) {
//                 final todo = Todo(
//                   id: uuid.v4(),
//                   title: _controller.text.trim(),
//                   isCompleted: false,
//                 );
//                 context.read<TodoBloc>().add(AddTodo(todo));
//                 _controller.clear();
//               }
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildTodoList() {
//     return BlocBuilder<TodoBloc, TodoState>(
//       builder: (context, state) {
//         if (state.todos.isEmpty) {
//           return const Padding(
//             padding: EdgeInsets.all(16),
//             child: Center(child: Text("No todos added yet.")),
//           );
//         }

//         return ListView.builder(
//           itemCount: state.todos.length,
//           shrinkWrap: true,
//           physics: const NeverScrollableScrollPhysics(),
//           itemBuilder: (context, index) {
//             final todo = state.todos[index];
//             return ListTile(
//               title: Text(
//                 todo.title,
//                 style: TextStyle(
//                   decoration: todo.isCompleted ? TextDecoration.lineThrough : null,
//                 ),
//               ),
//               leading: Checkbox(
//                 value: todo.isCompleted,
//                 onChanged: (_) {
//                   context.read<TodoBloc>().add(ToggleTodoStatus(todo));
//                 },
//               ),
//               trailing: IconButton(
//                 icon: const Icon(Icons.delete),
//                 onPressed: () {
//                   context.read<TodoBloc>().add(DeleteTodo(todo));
//                 },
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }


import 'package:daily_reminder/data/todo.dart';
import 'package:daily_reminder/todo_bloc/todo_bloc.dart';
import 'package:daily_reminder/todo_bloc/todo_event.dart';
import 'package:daily_reminder/todo_bloc/todo_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _showAddTodoDialog() {
    final controller = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Add Todo'),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(hintText: 'Enter todo'),
        ),
        actions: [
          TextButton(
            onPressed: () {
              final text = controller.text.trim();
              if (text.isNotEmpty) {
                final todo = Todo(
                  id: DateTime.now().toString(),
                  title: text,
                  isCompleted: false,
                );
                context.read<TodoBloc>().add(AddTodo(todo));
              }
              Navigator.of(ctx).pop();
            },
            child: Text('Add'),
          ),
        ],
      ),
    );
  }

  void _showEditTodoDialog(Todo todo) {
    final controller = TextEditingController(text: todo.title);

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Edit Todo'),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(hintText: 'Edit todo title'),
        ),
        actions: [
          TextButton(
            onPressed: () {
              final newText = controller.text.trim();
              if (newText.isNotEmpty) {
                final updatedTodo = todo.copyWith(title: newText);
                context.read<TodoBloc>().add(EditTodo(updatedTodo));
              }
              Navigator.of(ctx).pop();
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todo List')),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is TodoLoadSuccess) {
            final todos = state.todos;

            if (todos.isEmpty) {
              return Center(child: Text('No Todos!'));
            }

            return ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];
                return ListTile(
                  title: Text(todo.title),
                  leading: Checkbox(
                    value: todo.isCompleted,
                    onChanged: (_) {
                      context.read<TodoBloc>().add(ToggleTodoStatus(todo));
                    },
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () => _showEditTodoDialog(todo),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          context.read<TodoBloc>().add(DeleteTodo(todo));
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTodoDialog,
        child: Icon(Icons.add),
      ),
    );
  }
}
