// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'farmapp_farm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Farm _$FarmFromJson(Map<String, dynamic> json) => Farm(
      address: FarmAppAddress.fromJson(json['address'] as Map<String, dynamic>),
      farmId: json['farmId'],
      farmName: json['farmName'],
      farmSize: json['farmSize'],
      sizeType: _$enumDecode(_$SizeTypeEnumMap, json['sizeType']),
      owner: json['owner'],
      id: json['id'],
    );

Map<String, dynamic> _$FarmToJson(Farm instance) => <String, dynamic>{
      'id': instance.id,
      'farmId': instance.farmId,
      'farmName': instance.farmName,
      'farmSize': instance.farmSize,
      'sizeType': _$SizeTypeEnumMap[instance.sizeType],
      'owner': instance.owner,
      'address': instance.address,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$SizeTypeEnumMap = {
  SizeType.Acres: 'Acres',
  SizeType.Hectares: 'Hectares',
};
