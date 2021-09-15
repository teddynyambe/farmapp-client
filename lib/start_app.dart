import 'package:farmapp_mobile/home/view/home_screen.dart';
import 'package:farmapp_mobile/more_settings/view/more_settings.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = [
    HomeScreen(),
    Text('Index 2: Inventory'),
    Text('Index 3: Expenses'),
    Text('Index 4: Sales'),
    MoreSettingsScreen(),
  ];

  void _onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        selectedItemColor: Colors.white,
        selectedFontSize: 18,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white60,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.inventory), label: 'Inventory'),
          BottomNavigationBarItem(
              icon: Icon(Icons.compare_arrows), label: 'Expenses'),
          BottomNavigationBarItem(
              icon: Icon(Icons.arrow_upward_sharp), label: 'Sales'),
          BottomNavigationBarItem(icon: Icon(Icons.more), label: 'More'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onTapped,
      ),
    );
  }
}
