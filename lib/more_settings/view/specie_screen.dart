import 'package:farmapp_mobile/farm/model/farm_activity.dart';
import 'package:farmapp_mobile/farm/view_model/farmactivity_viewmodel.dart';
import 'package:farmapp_mobile/farm/view_model/farmactivitylist_modelview.dart';
import 'package:farmapp_mobile/more_settings/model_view/specie_viewmodel.dart';
import 'package:farmapp_mobile/more_settings/model_view/specielist_viewmodel.dart';
import 'package:farmapp_mobile/user/view_model/user_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SpecieScreen extends StatefulWidget {
  final String farmId;
  final UserViewModel loggedInUser;
  SpecieScreen({Key? key, required this.farmId, required this.loggedInUser})
      : super(key: key);

  @override
  _SpecieScreenState createState() => _SpecieScreenState();
}

class _SpecieScreenState extends State<SpecieScreen> {
  @override
  Widget build(BuildContext context) {
    final species = context.read<SpecieListViewModel>().species;

    return Container(
        padding: EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height / (species.length - 3),
        width: MediaQuery.of(context).size.width / 1.5,
        child: context.watch<SpecieListViewModel>().loading == true
            ? Center(child: CircularProgressIndicator())
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton.icon(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: Text("Alert"),
                                      content: Text("Update farm activities?"),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                              Navigator.pop(context);
                                            },
                                            child: Text("Cancel")),
                                        TextButton(
                                            onPressed: () {
                                              // context
                                              //     .read<SpecieListViewModel>()
                                              //     .setSpecies(species!);

                                              context
                                                  .read<
                                                      FarmActivityListModelView>()
                                                  .saveFarmActivities(
                                                      widget.farmId);
                                              Navigator.pop(context);
                                              Navigator.pop(context);
                                            },
                                            child: Text("Save")),
                                      ],
                                    ));
                          },
                          icon: Icon(Icons.check_box),
                          label: Text("Save")),
                      TextButton.icon(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.close_outlined),
                          label: Text("Close")),
                    ],
                  ),
                  Divider(),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(),
                      child: ListView.builder(
                        itemBuilder: (_, index) {
                          return _specieItem(species[index]);
                        },
                        itemCount: species.length,
                      ),
                    ),
                  ),
                  Divider()
                ],
              ));
  }

  Widget _specieItem(SpecieViewModel specie) {
    final farmActivity = context
        .watch<FarmActivityListModelView>()
        .farmActivities
        .where((element) =>
            element.specie.specieId == specie.specieId &&
            element.farmId == widget.farmId);
    return CheckboxListTile(
      checkColor: Theme.of(context).primaryColor,
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(specie.specie),
      value: farmActivity.isEmpty ? false : true,
      onChanged: (bool? value) {
        setState(() {
          value!
              ? context.read<FarmActivityListModelView>().addFarmActivity(
                  FarmActivityViewModel(
                      farmActivity: FarmActivity.fromSpecie(
                          specieViewModel: specie,
                          farmId: widget.farmId,
                          owner: widget.loggedInUser.userId)))
              : context.read<FarmActivityListModelView>().removeFarmActivity(
                  FarmActivityViewModel(
                      farmActivity: FarmActivity.fromSpecie(
                          specieViewModel: specie,
                          farmId: widget.farmId,
                          owner: widget.loggedInUser.userId)));
        });
      },
    );
  }
}
