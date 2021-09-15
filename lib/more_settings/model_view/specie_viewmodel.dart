import 'package:farmapp_mobile/more_settings/model/specie.dart';

class SpecieViewModel {
  final Specie _specie;
  bool _selected;
  SpecieViewModel({specie, selected})
      : this._specie = specie,
        this._selected = selected;

  String get id => _specie.id.toString();
  String get specieId => _specie.specieId;
  String get specie => _specie.specie;
  bool get selected => _selected;
  set selected(value) => _selected = value;
  Specie get getSpecie => _specie;
}
