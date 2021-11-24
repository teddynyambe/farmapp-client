import 'package:farmapp_mobile/farm/view/crud_farm_screen.dart';
import 'package:farmapp_mobile/farm/view_model/farm_viewmodel.dart';
import 'package:farmapp_mobile/farm/view_model/farmactivitylist_modelview.dart';
import 'package:farmapp_mobile/more_settings/model_view/specielist_viewmodel.dart';
import 'package:farmapp_mobile/more_settings/view/specie_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FarmItem extends StatefulWidget {
  final FarmViewModel farmViewModel;
  final loggedInUser;
  FarmItem({required this.farmViewModel, this.loggedInUser});

  @override
  _FarmItemState createState() => _FarmItemState();
}

class _FarmItemState extends State<FarmItem> {
  @override
  void initState() {
    // WidgetsBinding.instance!.addPostFrameCallback((_) {
    //   context
    //       .read<SpecieListViewModel>()
    //       .fetchSpecies(widget.farmViewModel.farmId);
    // });
    super.initState();
  }

  _showFarmActivitiesBottomSheet(BuildContext context) {
    showModalBottomSheet(
        isDismissible: false,
        backgroundColor: Theme.of(context).accentColor,
        context: context,
        builder: (context) {
          return SpecieScreen(
            farmId: widget.farmViewModel.farmId,
            loggedInUser: widget.loggedInUser,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // print(
    //     "Specie Count: ${context.read<SpecieListViewModel>().currentFarmAnimals.length}");
    var farmActivities = context
        .watch<FarmActivityListModelView>()
        .farmActivities
        .where((element) => element.farmId == widget.farmViewModel.farmId)
        .toList();
    return ListTile(
      onLongPress: () {
        _showFarmActivitiesBottomSheet(context);
      },
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => FarmScreen(
                      farmId: widget.farmViewModel.farmId,
                    )));
      },
      title: Text(widget.farmViewModel.farmName),
      subtitle: Container(
        margin: EdgeInsets.only(left: 20),
        height: 18,
        child: ListView.separated(
          itemBuilder: (_, index) => Text(farmActivities[index].specie.specie),
          itemCount: farmActivities.length,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (BuildContext context, int index) =>
              VerticalDivider(),
        ),
      ),
    );
    // return Container(
    //   width: double.infinity,
    //   child: Card(
    //     child:
    //     Padding(
    //       padding: const EdgeInsets.symmetric(horizontal: 5),
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           Text(farmViewModel.farmName),
    //           SizedBox(
    //             width: 130,
    //             child: Row(
    //               mainAxisSize: MainAxisSize.min,
    //               mainAxisAlignment: MainAxisAlignment.end,
    //               children: [
    //                 TextButton(
    //                   onPressed: () {
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) => FarmScreen(
    //               farmId: farmViewModel.farmId,
    //             )));
    //                   },
    //                   child: Text("Edit"),
    //                 ),
    //                 TextButton(
    //                   onPressed: () {
    //                     _deleteFarm(context);
    //                   },
    //                   child: Text("Delete"),
    //                 ),
    //               ],
    //             ),
    //           )
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
