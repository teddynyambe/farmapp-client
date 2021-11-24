// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'farmapp_address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FarmAppAddress _$FarmAppAddressFromJson(Map<String, dynamic> json) =>
    FarmAppAddress(
      lineOne: json['lineOne'],
      lineTwo: json['lineTwo'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      town: json['town'],
      province: json['province'],
      country: json['country'],
      areaName: json['areaName'],
      id: json['id'],
    );

Map<String, dynamic> _$FarmAppAddressToJson(FarmAppAddress instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lineOne': instance.lineOne,
      'lineTwo': instance.lineTwo,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'town': instance.town,
      'province': instance.province,
      'country': instance.country,
      'areaName': instance.areaName,
    };
