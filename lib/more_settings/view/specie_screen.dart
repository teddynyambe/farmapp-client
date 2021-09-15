import 'package:farmapp_mobile/more_settings/model_view/specie_viewmodel.dart';
import 'package:farmapp_mobile/more_settings/model_view/specielist_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SpecieScreen extends StatefulWidget {
  SpecieScreen({Key? key}) : super(key: key);

  @override
  _SpecieScreenState createState() => _SpecieScreenState();
}

class _SpecieScreenState extends State<SpecieScreen> {
  List<SpecieViewModel>? species;
  @override
  void initState() {
    species = context.read<SpecieListViewModel>().species;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Select farm animals - activities",
            style: TextStyle(color: Theme.of(context).accentColor),
          ),
        ),
        body: context.watch<SpecieListViewModel>().loading == true
            ? CircularProgressIndicator()
            : Column(
                children: [
                  TextButton.icon(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  content: Text("Uppdate farm activities?"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                        },
                                        child: Text("Cancel")),
                                    TextButton(
                                        onPressed: () {
                                          context
                                              .read<SpecieListViewModel>()
                                              .setSpecies(species!);

                                          context
                                              .read<SpecieListViewModel>()
                                              .saveFarmActivity();
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                        },
                                        child: Text("Save")),
                                  ],
                                ));
                      },
                      icon: Icon(Icons.save),
                      label: Text("Save")),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(
                        left: 30.0,
                      ),
                      child: ListView.builder(
                        itemBuilder: (_, index) {
                          return _specieItem(species![index]);
                        },
                        itemCount:
                            context.read<SpecieListViewModel>().species.length,
                      ),
                    ),
                  ),
                ],
              ));
  }

  Widget _specieItem(SpecieViewModel specie) {
    return CheckboxListTile(
      checkColor: Theme.of(context).primaryColor,
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(specie.specie),
      value: specie.selected,
      onChanged: (bool? value) {
        setState(() {
          specie.selected = value;
        });
      },
    );
  }
}
