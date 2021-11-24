import 'package:farmapp_mobile/home/view/home_screen.dart';
import 'package:farmapp_mobile/more_settings/view/more_settings.dart';
import 'package:farmapp_mobile/user/view_model/user_viewmodel.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  final UserViewModel loggedInUser;
  StartScreen({Key? key, required this.loggedInUser}) : super(key: key);
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  int _selectedIndex = 0;

  void _onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = [
      HomeScreen(loggedInUser: widget.loggedInUser),
      Text('Index 2: Inventory'),
      Text('Index 3: Expenses'),
      Text('Index 4: Sales'),
      MoreSettingsScreen(loggedInUser: widget.loggedInUser),
    ];

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
