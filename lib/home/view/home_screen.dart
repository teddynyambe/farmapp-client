import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            bottom: const TabBar(tabs: [
              Tab(
                child: Text("Livestock"),
              ),
              Tab(
                child: Text("Crop"),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
