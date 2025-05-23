import 'package:daily_reminder/auth/auth.dart';
import 'package:daily_reminder/auth/guest.dart';
import 'package:daily_reminder/home.dart';
import 'package:daily_reminder/splash/splash.dart';
import 'package:daily_reminder/todo_bloc/todo_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: kIsWeb
        ? FirebaseOptions(
            apiKey: "AIzaSyDpS0UpsNPMc5Mxdt7xhrPUOchInayyoFs",
            authDomain: "flutter-reminder-48ccb.firebaseapp.com",
            projectId: "flutter-reminder-48ccb",
            storageBucket: "flutter-reminder-48ccb.appspot.com",
            messagingSenderId: "803296422447",
            appId: "1:803296422447:web:07d2e60971329ecce3f4da",
          )
        : null,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TodoBloc(),
      child: MaterialApp(
        title: 'Todo app',
        debugShowCheckedModeBanner: false,
        home: StreamBuilder<User?>(
          stream: Auth().authStateChanges,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return SplashScreen(); // uses context, so needs to be inside BlocProvider
            } else if (snapshot.hasData) {
              return HomePage(); // also uses Bloc
            } else {
              return GuestScreen();
            }
          },
        ),
      ),
    );
  }
}
