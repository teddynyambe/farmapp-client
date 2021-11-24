import 'package:json_annotation/json_annotation.dart';
part 'specie.g.dart';

@JsonSerializable()
class Specie {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "specieId")
  final String specieId;
  @JsonKey(name: "specie")
  final String specie;

  Specie({
    required this.id,
    required this.specie,
    required this.specieId,
  });

  factory Specie.fromJson(Map<String, dynamic> json) => _$SpecieFromJson(json);
  Map<String, dynamic> toJson() => _$SpecieToJson(this);
}
