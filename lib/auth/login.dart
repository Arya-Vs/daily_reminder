import 'package:daily_reminder/auth/auth.dart';
import 'package:daily_reminder/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

String?errorMessage="";
bool isLogin=true;

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

Future<void>signInWithEmailAndPassword()async{
  try {
    await Auth().signInWithEmailAndPassword(email: _emailController.text, password: _passController.text);
  } on FirebaseAuthException catch (e) {
    setState(() {
      errorMessage=e.message;
    });
    
  }

}

Future<void>createUserWithEmailAndPassword()async{
  try{
    await Auth().createUserWithEmailAndPassword(email: _emailController.text, password: _passController.text);
  }on FirebaseException catch(e){
    setState(() {
      errorMessage=e.message;
    });
  }
}

Widget _title(){
  return Text("Firebase Auth");
}
Widget _entryField(
  String title,
  TextEditingController controller,
){
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      labelText: title

    ),
  );
}

Widget _errorMessage(){
  return Text(errorMessage == '' ? '': 'Humm ? $errorMessage');
}


  void submit() async {
  if (_formKey.currentState!.validate()) {
    await signInWithEmailAndPassword();

    if (Auth().currentUser != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Sign in successful!"),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Invalid email or password"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( 
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Welcome back!\nGlad to see you, Again!",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 60),

              // Email
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your email";
                  }
                  final emailRegex =
                      RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                  if (!emailRegex.hasMatch(value)) {
                    return "Enter a valid email";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),

              // Password
              TextFormField(
                controller: _passController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your password";
                  } else if (value.length < 8) {
                    return "Password must be at least 8 characters";
                  } else if (!RegExp(r'[A-Z]').hasMatch(value)) {
                    return "Include at least one uppercase letter";
                  } else if (!RegExp(r'[a-z]').hasMatch(value)) {
                    return "Include at least one lowercase letter";
                  } else if (!RegExp(r'\d').hasMatch(value)) {
                    return "Include at least one number";
                  } else if (!RegExp(r'[!@#\$%^&*(),.?":{}|<>]')
                      .hasMatch(value)) {
                    return "Include at least one special character";
                  }
                  return null;
                },
              ),

              // Forgot Password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    print("Forgot Password tapped");
                  },
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(color: Colors.teal),
                  ),
                ),
              ),

              SizedBox(height: 30),

              // Submit Button
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: submit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
