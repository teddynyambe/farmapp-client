import 'package:farmapp_mobile/user/model/farmapp_user.dart';

class UserViewModel {
  FarmAppUser _user = FarmAppUser();
  // UserViewModel({required user}) : this._user = user;

  String get firstName => _user.firstName ?? "";
  String get lastName => _user.lastName ?? "";
  String get companyName => _user.companyName ?? "";
  String get mobileumber => _user.mobileNumber ?? "";
  String get userId => _user.userId ?? "";
  String get username => _user.username ?? "";
  String get password => _user.password ?? "";
  String get email => _user.email ?? "";
  String get id {
    return _user.id.toString();
  }

  set setUser(FarmAppUser user) => this._user = user;
}
