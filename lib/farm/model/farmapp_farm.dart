import 'package:farmapp_mobile/enums/size_type.dart';
import 'package:farmapp_mobile/farm/model/farmapp_address.dart';
import 'package:json_annotation/json_annotation.dart';
part 'farmapp_farm.g.dart';

@JsonSerializable()
class Farm {
  @JsonKey(name: "id")
  final id;
  @JsonKey(name: "farmId")
  final farmId;
  @JsonKey(name: "farmName")
  final farmName;
  @JsonKey(name: "farmSize")
  final farmSize;
  @JsonKey(name: "sizeType")
  final SizeType sizeType;
  @JsonKey(name: "owner")
  final owner;
  @JsonKey(name: "address")
  final FarmAppAddress address;

  Farm({
    required this.address,
    this.farmId,
    this.farmName,
    this.farmSize,
    required this.sizeType,
    this.owner,
    this.id,
  });

  factory Farm.fromJson(Map<String, dynamic> json) => _$FarmFromJson(json);
  Map<String, dynamic> toJson() => _$FarmToJson(this);
}
