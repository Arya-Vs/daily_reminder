import 'package:daily_reminder/auth/auth.dart';
import 'package:daily_reminder/drawer/drawer.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final User? user = Auth().currentUser;

  int _selectedIndex = 0;

  Future<void> signOut() async {
    await Auth().signOut();
  }

  final List<Widget> _pages = [
    const Center(child: Text('Home Page', style: TextStyle(fontSize: 20))),
    const Center(child: Text('Tasks Page', style: TextStyle(fontSize: 20))),
    const Center(child: Text('Health Page', style: TextStyle(fontSize: 20))),
    const Center(child: Text('Dashboard', style: TextStyle(fontSize: 20))),
    const Center(child: Text('Weekly Goals', style: TextStyle(fontSize: 20))),
  ];

  void _onItemTapped(int index) {
    if (_selectedIndex != index) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (user != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Welcome.. ${user!.displayName ?? ''}!'),
            backgroundColor: Colors.black,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          "${user?.email ?? 'Welcome..'}",
          style: const TextStyle(fontSize: 11.0, color: Colors.white),
        ),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            onPressed: () async {
              final shouldLogout = await showDialog<bool>(
                context: context,
                builder:
                    (context) => AlertDialog(
                      title: const Text('Confirm Logout'),
                      content: const Text('Are you sure you want to log out?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: const Text(
                            'Cancel',
                            style: TextStyle(color: Colors.teal),
                          ),
                        ),
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(true),
                          child: const Text(
                            'Logout',
                            style: TextStyle(color: Colors.teal),
                          ),
                        ),
                      ],
                    ),
              );
              if (shouldLogout == true) {
                await signOut();
              }
            },
            icon: const Icon(
              Icons.logout_outlined,
              color: Colors.white,
              size: 20.0,
            ),
          ),
        ],
      ),
      drawer: CustomDrawer(onSignOut: signOut),

      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (child, animation) {
          return FadeTransition(opacity: animation, child: child);
        },
        child: _pages[_selectedIndex],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.task), label: 'Tasks'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Health'),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics_outlined),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flag),
            label: 'Weekly Goals',
          ),
        ],
      ),
    );
  }
}
