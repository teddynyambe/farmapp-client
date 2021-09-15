import 'dart:convert';

import 'package:farmapp_mobile/more_settings/model/specie.dart';
import 'package:farmapp_mobile/more_settings/model_view/specie_viewmodel.dart';
import 'package:farmapp_mobile/util/Constants.dart';
import 'package:http/http.dart' as http;

class MaintenanceAPI {
  Future<List<SpecieViewModel>> fetchSpecies(
      String accessToken, String owner) async {
    try {
      final response = await http.get(
          Uri.parse(Constant.FARMAPP_API_DOMAIN +
              Constant.SPECIE_EP +
              Constant.GET_SPECIES +
              "/" +
              owner),
          headers: {"Authorization": "Bearer accessToken"});

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        Iterable results = json["results"];
        return results
            .map((specie) => SpecieViewModel(
                specie: Specie.fromJson(specie["specie"]),
                selected: specie["selected"]))
            .toList();
      } else {
        throw Exception("Failed to fetch species");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> saveFarmActivity(
      List<SpecieViewModel> species, String accessToken) async {
    Map<String, dynamic> data = Map();
    species.forEach((element) {
      if (element.selected == true) {
        data[element.specie] = jsonEncode(element.getSpecie);
      }
    });
    print(data);
    // final response = await http.post(
    //     Uri.parse(Constant.FARMAPP_API_DOMAIN +
    //         Constant.FARM_ACTIVITY_EP +
    //         Constant.FARM_ACTIVITY_SAVE),
    //     headers: {"Authorization": "Bearer accessToken"});
  }
}
