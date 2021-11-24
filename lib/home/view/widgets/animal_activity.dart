import 'package:farmapp_mobile/farm/view_model/farmactivitylist_modelview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnimalActivityDetails extends StatelessWidget {
  final farmId;
  const AnimalActivityDetails({Key? key, this.farmId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final farmActivities = context
        .watch<FarmActivityListModelView>()
        .farmActivities
        .where((element) => element.farmId == farmId)
        .toList();
    print("Animals: ${farmActivities.length}");
    return ListView.builder(
        itemCount: farmActivities.length,
        shrinkWrap: true,
        itemBuilder: (context, index) => Card(
            elevation: 3,
            child: ListTile(
              title: Text(farmActivities[index].specie.specie),
              subtitle: Text("Bulls (2) Cows (20)"),
              trailing: Text("Total: 22"),
              onTap: () {},
            )));

    //   (
    //     3,
    //     (index) => Card(
    //       elevation: 3,
    //       child: ListTile(
    //         title: Text("Cattle"),
    //         subtitle: Text("Bulls (2) Cows (20)"),
    //         trailing: Text("Total: 22"),
    //         onTap: () {},
    //       ),
    //     ),
    //   ),
    // );
  }
}
