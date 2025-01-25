import 'package:flutter/material.dart';
import 'package:nesttask/App_Pages/HomePage.dart';
import 'package:nesttask/App_Pages/Notification.dart';
import 'package:nesttask/App_Pages/SearchPage.dart';
import 'package:nesttask/App_Pages/UpcomingTask.dart';
//import 'package:nesttask/App_Pages/NotificationsPage.dart'; // Example import for Notifications screen.

class Bottomnavbar extends StatefulWidget {
  const Bottomnavbar({super.key});

  @override
  State<Bottomnavbar> createState() => _BottomnavbarState();
}

class _BottomnavbarState extends State<Bottomnavbar> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    Homepage(),
    Upcomingtask(),
    Searchpage(),
    NotificationPage()
   // Add corresponding screen for Notifications.
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white, // Change the background color.
        selectedItemColor: Colors.deepPurpleAccent, // Color for the selected icon and label.
        unselectedItemColor: Colors.grey, // Color for unselected icons and labels.
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
            icon: Icon(Icons.calendar_month),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
        ],
      ),
    );
  }
}