import 'package:farmapp_mobile/more_settings/model/specie.dart';
import 'package:farmapp_mobile/more_settings/model_view/specie_viewmodel.dart';
import 'package:farmapp_mobile/more_settings/service/maintenance_api.dart';
import 'package:flutter/material.dart';

class SpecieListViewModel extends ChangeNotifier {
  List<SpecieViewModel> _species = [];
  bool loading = false;
  String accessToken = "";

  Future<void> fetchSpecies(String owner) async {
    try {
      loading = true;
      notifyListeners();
      _species = await MaintenanceAPI().fetchSpecies(accessToken, owner);
      loading = false;
      notifyListeners();
    } catch (e) {
      loading = false;
      throw Exception(e.toString());
    }
  }

  void setSpecies(List<SpecieViewModel> s) {
    this._species = s;
    notifyListeners();
  }

  List<SpecieViewModel> get species => _species;

  List<SpecieViewModel> get currentFarmAnimals {
    return _species.where((activity) => activity.selected == true).toList();
  }

  Future<void> saveFarmActivity() async {
    loading = true;
    notifyListeners();
    await MaintenanceAPI().saveFarmActivity(_species, accessToken);
    loading = false;
    notifyListeners();
  }
}
