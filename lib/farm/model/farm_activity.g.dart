// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'farm_activity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FarmActivity _$FarmActivityFromJson(Map<String, dynamic> json) => FarmActivity(
      id: json['id'],
      specie: Specie.fromJson(json['specie'] as Map<String, dynamic>),
      farmId: json['farmId'],
      owner: json['owner'],
    );

Map<String, dynamic> _$FarmActivityToJson(FarmActivity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'specie': instance.specie,
      'farmId': instance.farmId,
      'owner': instance.owner,
    };
