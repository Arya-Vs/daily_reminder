import 'package:daily_reminder/auth/guest.dart';
import 'package:daily_reminder/auth/login.dart';
import 'package:daily_reminder/auth/signin.dart';
import 'package:daily_reminder/home.dart';
import 'package:daily_reminder/splash/splash.dart';
import 'package:daily_reminder/todo_bloc/todo_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:io'; 

void main()async {
// WidgetsFlutterBinding.ensureInitialized();
// HydratedBloc.storage=await HydratedStorage.build(
//   storageDirectory: await getTemporaryDirectory(),
// );

WidgetsFlutterBinding.ensureInitialized();

if(kIsWeb){
 await Firebase.initializeApp(options: FirebaseOptions( apiKey: "AIzaSyDpS0UpsNPMc5Mxdt7xhrPUOchInayyoFs",
  authDomain: "flutter-reminder-48ccb.firebaseapp.com",
  projectId: "flutter-reminder-48ccb",
  storageBucket: "flutter-reminder-48ccb.firebasestorage.app",
  messagingSenderId: "803296422447",
  appId: "1:803296422447:web:07d2e60971329ecce3f4da"));

}else{
 await Firebase.initializeApp();
}


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo app',
     
      debugShowCheckedModeBanner: false,
      // home: BlocProvider(
      //   create: (context) => TodoBloc()..add(TodoStarted()),
      //   child: HomeScreen(),
      // ),
      home: GuestScreen(),
    );
  }
}
