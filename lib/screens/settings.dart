import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings",style: TextStyle(color:Colors.white),),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: ListView(
        children: const [
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Account"),
            subtitle: Text("Manage your account settings"),
          ),
          Divider(),

          ListTile(
            leading: Icon(Icons.notifications),
            title: Text("Notifications"),
            subtitle: Text("Notification preferences"),
          ),
          Divider(),

          ListTile(
            leading: Icon(Icons.lock),
            title: Text("Privacy"),
            subtitle: Text("Manage your privacy options"),
          ),
          Divider(),

          ListTile(
            leading: Icon(Icons.info),
            title: Text("About"),
            subtitle: Text("App version and info"),
          ),
        ],
      ),
    );
  }
}
