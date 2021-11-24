import 'package:farmapp_mobile/farm/view_model/farmactivitylist_modelview.dart';
import 'package:farmapp_mobile/farm/view_model/farmlist_viewmodel.dart';
import 'package:farmapp_mobile/more_settings/model_view/specielist_viewmodel.dart';
import 'package:farmapp_mobile/util/scroll_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StartUps {
  //Load Farms Activities
  loadFarmActivities(BuildContext context, String owner) async {
    await context.read<FarmActivityListModelView>().fetchFarmActivities(owner);
  }

  //Load Farm
  loadFarms(BuildContext context, String owner) async {
    await context.read<FarmListViewModel>().fetchFarms(owner);
    int length = context.read<FarmListViewModel>().farms.length;
    context.read<ScrollList>().initial(Iterable<int>.generate(length).toList());
  }

  //Load Specie
  loadSpecies(BuildContext context, String owner) async {
    await context.read<SpecieListViewModel>().fetchSpecies();
  }
}
