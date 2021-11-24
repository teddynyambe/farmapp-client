// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Specie _$SpecieFromJson(Map<String, dynamic> json) => Specie(
      id: json['id'] as int,
      specie: json['specie'] as String,
      specieId: json['specieId'] as String,
    );

Map<String, dynamic> _$SpecieToJson(Specie instance) => <String, dynamic>{
      'id': instance.id,
      'specieId': instance.specieId,
      'specie': instance.specie,
    };
