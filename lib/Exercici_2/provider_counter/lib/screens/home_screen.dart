import 'package:flutter/material.dart';
import 'package:provider_counter/pages/page1.dart';
import 'package:provider_counter/pages/page2.dart';
import 'package:provider_counter/pages/page3.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static final List<Widget> _pages = [Page1(), Page2(), Page3()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Provider Counter")),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.looks_one), label: "Page 1"),
          BottomNavigationBarItem(icon: Icon(Icons.looks_two), label: "Page 2"),
          BottomNavigationBarItem(icon: Icon(Icons.looks_3), label: "Page 3"),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
