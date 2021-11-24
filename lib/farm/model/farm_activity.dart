import 'package:farmapp_mobile/more_settings/model/specie.dart';
import 'package:farmapp_mobile/more_settings/model_view/specie_viewmodel.dart';
import 'package:json_annotation/json_annotation.dart';
part 'farm_activity.g.dart';

@JsonSerializable()
class FarmActivity {
  @JsonKey(name: 'id')
  final id;
  @JsonKey(name: 'specie')
  final Specie specie;
  @JsonKey(name: 'farmId')
  final farmId;
  @JsonKey(name: 'owner')
  final owner;
  FarmActivity({this.id, required this.specie, this.farmId, this.owner});
  FarmActivity.fromSpecie(
      {required SpecieViewModel specieViewModel, id, farmId, owner})
      : this.id = id,
        this.specie = specieViewModel.getSpecie,
        this.farmId = farmId,
        this.owner = owner;

  factory FarmActivity.fromJson(Map<String, dynamic> json) =>
      _$FarmActivityFromJson(json);
  Map<String, dynamic> toJson() => _$FarmActivityToJson(this);
}
