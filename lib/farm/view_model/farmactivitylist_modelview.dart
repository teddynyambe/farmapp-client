import 'package:farmapp_mobile/farm/model/farm_activity.dart';
import 'package:farmapp_mobile/farm/service/farm_api.dart';
import 'package:farmapp_mobile/farm/view_model/farmactivity_viewmodel.dart';
import 'package:flutter/material.dart';

class FarmActivityListModelView extends ChangeNotifier {
  List<FarmActivityViewModel> farmActivities = [];
  final accessToken = "";
  fetchFarmActivities(String owner) async {
    final results = await FarmAPI().fetchFarmActivities(owner, accessToken);
    farmActivities = results
        .map((item) => FarmActivityViewModel(farmActivity: item))
        .toList();
    notifyListeners();
  }

  removeFarmActivity(FarmActivityViewModel farmActivityViewModel) {
    farmActivities.removeWhere((element) =>
        element.specie.specieId == farmActivityViewModel.specie.specieId &&
        element.farmId == farmActivityViewModel.farmId);
    notifyListeners();
  }

  addFarmActivity(FarmActivityViewModel farmActivityViewModel) {
    farmActivities.add(farmActivityViewModel);
    notifyListeners();
  }

  saveFarmActivities(String farmId) {
    final activities = farmActivities
        .where((activity) => activity.farmId == farmId)
        .map((e) => FarmActivity(
            specie: e.specie, farmId: e.farmId, id: e.id, owner: e.owner))
        .toList();
    FarmAPI().saveFarmActivities(activities, farmId, accessToken);
  }
}
