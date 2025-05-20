import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Privacy Policy",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Privacy Policy",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                "Welcome to Daily Reminder. Your privacy is important to us, and we are committed to protecting the personal information you share with us. "
                "This privacy policy explains how we collect, use, and safeguard your data when you use our application.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),

              Text(" Information We Collect",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              SizedBox(height: 6),
              Text(
                " Email Address: Used for login, authentication, and to sync your reminders.\n"
                " User Name: Collected during registration to personalize your experience.\n"
                " Reminder Data: Tasks, notes, and schedules that you create and manage within the app.\n"
                " Device Info: For error reporting and analytics (non-personally identifiable).",
              ),
              SizedBox(height: 16),

              Text(" How We Use Your Information",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              SizedBox(height: 6),
              Text(
                " To allow you to create, edit, and manage daily reminders.\n"
                " To notify you about upcoming tasks or scheduled events.\n"
                " To personalize your experience based on your name and account.\n"
                " To improve the app experience and fix bugs through anonymous analytics.",
              ),
              SizedBox(height: 16),

              Text(" Data Storage & Security",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              SizedBox(height: 6),
              Text(
                "Your data is stored securely using Firebase Authentication and Firestore services. "
                "We use secure methods to prevent unauthorized access and ensure your data is encrypted and safe.",
              ),
              SizedBox(height: 16),

              Text(" Sharing & Disclosure",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              SizedBox(height: 6),
              Text(
                "We do not share your personal information or reminder data with third parties. "
                "All your information remains confidential and is only used to improve the app experience.",
              ),
              SizedBox(height: 16),

              Text(" Changes to This Policy",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              SizedBox(height: 6),
              Text(
                "We may update this policy occasionally. You will be notified through the app if any major changes are made.",
              ),
              SizedBox(height: 16),

              Text(" Contact Us",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              SizedBox(height: 6),
              Text(
                "If you have any questions or concerns about this Privacy Policy, please contact us at: "
                "support@dailyreminder.app",
              ),
              SizedBox(height: 24),

              Text(
                "Thank you for using Daily Reminder!",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
