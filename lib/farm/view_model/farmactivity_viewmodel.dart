import 'package:farmapp_mobile/farm/model/farm_activity.dart';
import 'package:farmapp_mobile/more_settings/model/specie.dart';

class FarmActivityViewModel {
  final FarmActivity farmActivity;
  FarmActivityViewModel({required this.farmActivity});
  String get id => farmActivity.id.toString();
  Specie get specie => farmActivity.specie;
  String get farmId => farmActivity.farmId;
  String get owner => farmActivity.owner;
}
