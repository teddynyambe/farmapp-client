import 'package:farmapp_mobile/enums/size_type.dart';
import 'package:farmapp_mobile/farm/model/farmapp_farm.dart';

class FarmViewModel {
  final Farm _farm;
  FarmViewModel({farm}) : this._farm = farm;
  String get farmName => _farm.farmName ?? "";
  String get farmSize {
    return _farm.farmSize.toString();
  }

  String get id {
    return _farm.id.toString();
  }

  SizeType get sizeType => _farm.sizeType;
  String get farmId => _farm.farmId;
  String get owner => _farm.owner;
  String get lineOne => _farm.address.lineOne ?? "";
  String get lineTwo => _farm.address.lineTwo ?? "";
  String get latitude => _farm.address.latitude ?? "";
  String get longitude => _farm.address.longitude ?? "";
  String get town => _farm.address.town ?? "";
  String get province => _farm.address.province ?? "";
  String get country => _farm.address.country ?? "";
  String get areaName => _farm.address.areaName ?? "";
  String get addressId {
    return _farm.address.id.toString();
  }

  // Farm get farm => this._farm;
}
