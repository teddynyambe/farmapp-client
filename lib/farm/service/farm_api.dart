import 'dart:convert';

import 'package:farmapp_mobile/farm/model/farm_activity.dart';
import 'package:farmapp_mobile/farm/model/farmapp_farm.dart';
import 'package:farmapp_mobile/farm/view_model/farmactivity_viewmodel.dart';
import 'package:farmapp_mobile/util/Constants.dart';
import 'package:http/http.dart' as http;

class FarmAPI {
  Future<bool> saveFarmCall(Farm farm, String accessToken) async {
    final body = jsonEncode(farm.toJson());
    final headers = {
      "Content-Type": "application/json",
      'Authorization': 'Bearer $accessToken'
    };
    final response = await http.post(
        Uri.parse(Constant.FARMAPP_API_DOMAIN +
            Constant.FARM_EP +
            Constant.FARM_SAVE_EP),
        body: body,
        headers: headers);
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception("Error: Failed to save farm details.");
    }
  }

  Future<List<Farm>> fetchFarms(String owner, String accessToken) async {
    final response = await http.get(
      Uri.parse(Constant.FARMAPP_API_DOMAIN +
          Constant.FARM_EP +
          Constant.GET_ALL_FARM +
          "/$owner"),
      headers: {'Authorization': 'Bearer $accessToken'},
    );
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      Iterable result = json["results"];
      return result.map((item) => Farm.fromJson(item)).toList();
    } else {
      throw Exception("Failed to get Farm(s)");
    }

    // final response  = ;
  }

  Future<void> deleteFarm(farmId, accessToken) async {
    try {
      final response = await http.delete(
          Uri.parse(
              Constant.FARMAPP_API_DOMAIN + Constant.FARM_EP + "/$farmId"),
          headers: {'Authorization': 'Bearer $accessToken'});
      if (response.statusCode == 200) {
        ///
      } else {
        throw Exception("Failed to delete Farm.");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<FarmActivity>> fetchFarmActivities(
      String owner, String accessToken) async {
    final headers = {
      "Content-Type": "application/json",
      'Authorization': 'Bearer $accessToken'
    };
    final response = await http.get(
        Uri.parse(Constant.FARMAPP_API_DOMAIN +
            Constant.FARM_ACTIVITY_EP +
            Constant.FARM_ACTIVITY_GET_EP +
            '/$owner'),
        headers: headers);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      Iterable results = json['results'];
      return results.map((item) => FarmActivity.fromJson(item)).toList();
    } else {
      throw Exception('Failed to get farm activities for $owner');
    }
  }

  Future<void> saveFarmActivities(List<FarmActivity> farmActivities,
      String farmId, String accessToken) async {
    // List<dynamic> data = [];
    // species.forEach((element) {
    //   data.add({
    //     "farmId": farmId,
    //     "owner": owner,
    //     "specie": {"id": element.getSpecie.id},
    //   });
    // });
    final data = jsonEncode(farmActivities);
    print(data);
    try {
      final response = await http.post(
          Uri.parse(Constant.FARMAPP_API_DOMAIN +
              Constant.FARM_ACTIVITY_EP +
              Constant.FARM_ACTIVITY_SAVE +
              '/' +
              farmId),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer accessToken"
          },
          body: data);
      if (response.statusCode == 200) {
        return null;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
