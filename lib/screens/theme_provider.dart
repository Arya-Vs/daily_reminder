// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class ThemeProvider extends ChangeNotifier {
//   bool _isDarkMode = false;
//   bool get isDarkMode => _isDarkMode;

//   final _auth = FirebaseAuth.instance;
//   final _firestore = FirebaseFirestore.instance;

//   ThemeProvider() {
//     _loadTheme();
//   }

//   Future<void> _loadTheme() async {
//     final user = _auth.currentUser;
//     if (user != null) {
//       final doc = await _firestore.collection('users').doc(user.uid).get();
//       if (doc.exists && doc.data()!.containsKey('isDarkMode')) {
//         _isDarkMode = doc['isDarkMode'];
//         notifyListeners();
//       }
//     }
//   }

//   Future<void> toggleTheme(bool value) async {
//     _isDarkMode = value;
//     notifyListeners();

//     final user = _auth.currentUser;
//     if (user != null) {
//       await _firestore.collection('users').doc(user.uid).set({
//         'isDarkMode': _isDarkMode,
//       }, SetOptions(merge: true));
//     }
//   }
// }
