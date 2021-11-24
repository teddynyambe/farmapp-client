import 'package:farmapp_mobile/enums/size_type.dart';
import 'package:farmapp_mobile/farm/model/farmapp_address.dart';
import 'package:farmapp_mobile/farm/model/farmapp_farm.dart';
import 'package:farmapp_mobile/farm/service/farm_api.dart';
import 'package:flutter/material.dart';

class CrudFarmViewModel extends ChangeNotifier {
  String? id;
  String? farmName;
  String? farmSize;
  SizeType? sizeType;
  String? owner;
  String? lineOne;
  String? lineTwo;
  String? latitude;
  String? longitude;
  String? town;
  String? province;
  String? country;
  String? areaName;
  String? addressId;
  String? farmId;

  bool loading = false;
  String accessToken = "";

  Future<void> saveFarm() async {
    print("FarmName: $farmName");
    //     "String? $id; String? $farmName; String? $farmSize;  SizeType? $sizeType; String? $owner; String? $lineOne; String? $lineTwo; String? $latitude; String? $longitude; String? $town; String? $province; String? $country; String? $areaName; $String? addressId;");

    try {
      loading = true;
      notifyListeners();
      await FarmAPI().saveFarmCall(
        Farm(
          address: FarmAppAddress(
            town: town,
            province: province,
            longitude: longitude,
            lineTwo: lineTwo,
            lineOne: lineOne,
            country: country,
            areaName: areaName,
            latitude: latitude,
            id: addressId,
          ),
          sizeType: sizeType!,
          owner: owner,
          farmSize: farmSize,
          farmName: farmName,
          farmId: farmId,
          id: id,
        ),
        accessToken,
      );
      _resetFields();
      loading = false;

      notifyListeners();
    } catch (e) {
      loading = false;
      throw Exception(e.toString());
    }
  }

  Future<void> deleteFarm(farmId) async {
    try {
      loading = true;
      await FarmAPI().deleteFarm(farmId, accessToken);
      loading = false;
    } catch (e) {
      loading = false;
      throw Exception(e.toString());
    }
  }

  _resetFields() {
    id = "";
    farmName = "";
    farmSize = "";
    sizeType = SizeType.Acres;
    owner = "";
    lineOne = "";
    lineTwo = "";
    latitude = "";
    longitude = "";
    town = "";
    province = "";
    country = "";
    areaName = "";
    addressId = "";
    farmId = "";
  }
}
