import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'detail_screen.dart';
import 'profile_screen.dart';
import '../models/user_model.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  User? _selectedUser;

  void _onUserSelected(User user) {
    setState(() {
      _selectedUser = user;
      _currentIndex = 1;
    });
  }

  void _onLogout() {
    setState(() {
      _currentIndex = 0;
      _selectedUser = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      HomeScreen(onUserSelected: _onUserSelected),
      DetailScreen(user: _selectedUser),
      ProfileScreen(onLogout: _onLogout),
    ];

    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Detail',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}