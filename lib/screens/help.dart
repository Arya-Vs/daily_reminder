import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Help & Support",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const [
            Text(
              "Need Help?",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              "Welcome to Daily Reminder! Here are some common questions and helpful tips to get you started.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),

            Text(
              " How to add a new reminder?",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              " Tap on the '+' icon or 'Add Reminder' button.\n Fill in the title, time, and description.\n Tap Save to create your reminder.",
            ),
            SizedBox(height: 16),

            Text(
              " Can I edit or delete reminders?",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              "Yes! Tap on the reminder from the list to edit it. Long press or swipe to delete.",
            ),
            SizedBox(height: 16),

            Text(
              " How to enable notifications?",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              "Go to your device settings and ensure notifications are allowed for Daily Reminder.",
            ),
            SizedBox(height: 16),

            Text(
              " How to reset my password?",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              "On the login screen, tap 'Forgot Password' and follow the instructions to reset your password.",
            ),
            SizedBox(height: 16),

            Text(
              " How to contact support?",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              "You can email us at: support@dailyreminder.app\nWe usually respond within 24 hours.",
            ),
            SizedBox(height: 24),

            Text(
              "We're here to help. Thanks for using Daily Reminder!",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
