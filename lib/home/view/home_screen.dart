import 'package:farmapp_mobile/farm/view_model/farm_viewmodel.dart';
import 'package:farmapp_mobile/farm/view_model/farmlist_viewmodel.dart';
import 'package:farmapp_mobile/home/view/animal_screen.dart';
import 'package:farmapp_mobile/home/view/crop_screen.dart';
import 'package:farmapp_mobile/user/view_model/user_viewmodel.dart';
import 'package:farmapp_mobile/util/scroll_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  final UserViewModel loggedInUser;
  const HomeScreen({Key? key, required this.loggedInUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List<FarmViewModel> farms = context.read<FarmListViewModel>().farms;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            bottom: const TabBar(tabs: [
              Tab(
                child: Text(
                  "Livestock",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Tab(
                child: Text("Crop",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              )
            ]),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TabBarView(children: [
            AnimalScreen(loggedInUser: loggedInUser),
            CropScreen(),
          ]),
        ),
      ),
    );
  }
}
