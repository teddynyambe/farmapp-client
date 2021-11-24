// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'farmapp_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FarmAppUser _$FarmAppUserFromJson(Map<String, dynamic> json) => FarmAppUser(
      id: json['id'],
      userId: json['userId'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      username: json['username'],
      mobileNumber: json['mobileNumber'],
      password: json['password'],
      email: json['emailAddress'],
      companyName: json['companyName'],
      role: _$enumDecodeNullable(_$RolesEnumMap, json['role']) ?? Roles.Owner,
    );

Map<String, dynamic> _$FarmAppUserToJson(FarmAppUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'username': instance.username,
      'mobileNumber': instance.mobileNumber,
      'emailAddress': instance.email,
      'password': instance.password,
      'role': _$RolesEnumMap[instance.role],
      'companyName': instance.companyName,
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

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$RolesEnumMap = {
  Roles.Supervisor: 'Supervisor',
  Roles.Owner: 'Owner',
  Roles.Manager: 'Manager',
  Roles.Worker: 'Worker',
};
