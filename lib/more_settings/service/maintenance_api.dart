import 'dart:convert';

import 'package:farmapp_mobile/more_settings/model/specie.dart';
import 'package:farmapp_mobile/more_settings/model_view/specie_viewmodel.dart';
import 'package:farmapp_mobile/util/Constants.dart';
import 'package:http/http.dart' as http;

class MaintenanceAPI {
  final accessToken = "";
  Future<List<SpecieViewModel>> fetchSpecies() async {
    try {
      final response = await http.get(
          Uri.parse(Constant.FARMAPP_API_DOMAIN +
              Constant.SPECIE_EP +
              Constant.GET_SPECIES),
          headers: {"Authorization": "Bearer accessToken"});

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        Iterable results = json["results"];
        return results
            .map((specie) => SpecieViewModel(specie: Specie.fromJson(specie)))
            .toList();
      } else {
        throw Exception("Failed to fetch species");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Future<void> saveFarmActivity(List<SpecieViewModel> species,
  //     String accessToken, String owner, String farmId) async {
  //   List<dynamic> data = [];
  //   species.forEach((element) {
  //     data.add({
  //       "farmId": farmId,
  //       "owner": owner,
  //       "specie": {"id": element.getSpecie.id},
  //     });
  //   });
  //   print(json.encode(data));
  //   try {
  //     final response = await http.post(
  //         Uri.parse(Constant.FARMAPP_API_DOMAIN +
  //             Constant.FARM_ACTIVITY_EP +
  //             Constant.FARM_ACTIVITY_SAVE +
  //             "/" +
  //             farmId),
  //         headers: {
  //           "Content-Type": "application/json",
  //           "Authorization": "Bearer accessToken"
  //         },
  //         body: json.encode(data));
  //     if (response.statusCode == 200) {
  //       return null;
  //     }
  //   } catch (e) {
  //     throw Exception(e.toString());
  //   }
  // }
}
