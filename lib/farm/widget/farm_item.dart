import 'package:farmapp_mobile/farm/view/farm_screen.dart';
import 'package:farmapp_mobile/farm/view_model/crudfarm_viewmodel.dart';
import 'package:farmapp_mobile/farm/view_model/farm_viewmodel.dart';
import 'package:farmapp_mobile/farm/view_model/farmlist_viewmodel.dart';
import 'package:farmapp_mobile/user/view_model/userregistration_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FarmItem extends StatelessWidget {
  final FarmViewModel farmViewModel;

  FarmItem({required this.farmViewModel});

  _deleteFarm(BuildContext context) {
    showDialog<String>(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text("Alert"),
              content: Row(
                children: [
                  Icon(
                    Icons.warning_amber_rounded,
                    size: 50,
                    color: Colors.red,
                  ),
                  Flexible(
                    child: Text(
                      "You will lose all information related to this farm. Are you sure you want the delete ${farmViewModel.farmName}?",
                    ),
                  )
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancel"),
                ),
                TextButton(
                  onPressed: () async {
                    await context
                        .read<CrudFarmViewModel>()
                        .deleteFarm(farmViewModel.farmId);
                    context.read<FarmListViewModel>().fetchFarms(
                        context.read<UserRegistrationViewModel>().user.userId);
                    Navigator.pop(context);
                  },
                  child: context.watch<CrudFarmViewModel>().loading
                      ? CircularProgressIndicator()
                      : Text("Delete"),
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(farmViewModel.farmName),
              SizedBox(
                width: 130,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FarmScreen(
                                      farmId: farmViewModel.farmId,
                                    )));
                      },
                      child: Text("Edit"),
                    ),
                    TextButton(
                      onPressed: () {
                        _deleteFarm(context);
                      },
                      child: Text("Delete"),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
