import 'package:farmapp_mobile/more_settings/model/specie.dart';

class SpecieViewModel {
  final Specie _specie;
  SpecieViewModel({specie}) : this._specie = specie;

  String get id => _specie.id.toString();
  String get specieId => _specie.specieId;
  String get specie => _specie.specie;
  Specie get getSpecie => _specie;
}
