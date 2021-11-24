import 'package:farmapp_mobile/farm/view_model/farm_viewmodel.dart';
import 'package:farmapp_mobile/util/Constants.dart';
import 'package:flutter/material.dart';

import 'animal_activity.dart';

class FarmDetails extends StatefulWidget {
  final FarmViewModel farm;
  const FarmDetails({Key? key, required this.farm}) : super(key: key);

  @override
  _FarmDetailsState createState() => _FarmDetailsState();
}

class _FarmDetailsState extends State<FarmDetails> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 20,
      // height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Card(
            margin: EdgeInsets.only(bottom: 20, right: 5, left: 5),
            elevation: 5,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            color: Theme.of(context).accentColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                    ),
                    // width: 410,
                    // width: double.infinity,
                    padding: EdgeInsets.all(8),
                    child: Center(
                        child: Text(
                      "${widget.farm.farmName}".toUpperCase(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ))),
                Container(
                  child: Text(
                    "Animals",
                    style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: AnimalActivityDetails(farmId: widget.farm.farmId),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 20,
                      child: FloatingActionButton(
                        backgroundColor: Theme.of(context).primaryColor,
                        foregroundColor: Theme.of(context).accentColor,
                        onPressed: () {},
                        child: Icon(Icons.add),
                        elevation: 5,
                      ),
                    ),
                  ],
                ),
                Container(
                  child: Text(
                    "Events",
                    style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            elevation: 5,
                            child: ListTile(
                              dense: true,
                              visualDensity: VisualDensity.comfortable,
                              leading: Text(
                                  Constant.dateTimeFormater(DateTime.now())),
                              title: Text("Cow"),
                              subtitle: Text("Vacination"),
                              onTap: () {},
                            ),
                          );
                        },
                        itemCount: 2,
                        // separatorBuilder: (BuildContext context, int index) =>
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 20,
                      child: FloatingActionButton(
                        backgroundColor: Theme.of(context).buttonColor,
                        foregroundColor: Colors.white,
                        onPressed: () {},
                        child: Icon(Icons.add),
                        elevation: 5,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
