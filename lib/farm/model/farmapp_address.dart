import 'package:json_annotation/json_annotation.dart';
part 'farmapp_address.g.dart';

@JsonSerializable()
class FarmAppAddress {
  @JsonKey(name: "id")
  final id;
  @JsonKey(name: "lineOne")
  final lineOne;
  @JsonKey(name: "lineTwo")
  final lineTwo;
  @JsonKey(name: "latitude")
  final latitude;
  @JsonKey(name: "longitude")
  final longitude;
  @JsonKey(name: "town")
  final town;
  @JsonKey(name: "province")
  final province;
  @JsonKey(name: "country")
  final country;
  @JsonKey(name: "areaName")
  final areaName;

  FarmAppAddress({
    this.lineOne,
    this.lineTwo,
    this.latitude,
    this.longitude,
    this.town,
    this.province,
    this.country,
    this.areaName,
    this.id,
  });

  factory FarmAppAddress.fromJson(Map<String, dynamic> json) =>
      _$FarmAppAddressFromJson(json);
  Map<String, dynamic> toJson() => _$FarmAppAddressToJson(this);
}
