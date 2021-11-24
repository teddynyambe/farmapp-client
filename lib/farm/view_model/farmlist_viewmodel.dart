import 'package:farmapp_mobile/farm/service/farm_api.dart';
import 'package:farmapp_mobile/farm/view_model/farm_viewmodel.dart';
import 'package:flutter/cupertino.dart';

class FarmListViewModel extends ChangeNotifier {
  List<FarmViewModel> _farms = [];
  var error = "";
  bool loading = false;
  String accessToken = "";

  List<FarmViewModel> get farms => _farms;

  Future<void> fetchFarms(String owner) async {
    loading = true;
    notifyListeners();
    final result = await FarmAPI().fetchFarms(owner, accessToken);
    _farms = result.map((item) => FarmViewModel(farm: item)).toList();
    loading = false;
    notifyListeners();
  }

  FarmViewModel getFarmById(String farmId) {
    return _farms.firstWhere((farm) => farm.farmId == farmId);
  }
}
