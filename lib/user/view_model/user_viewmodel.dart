import 'package:farmapp_mobile/user/model/farmapp_user.dart';

class UserViewModel {
  final FarmAppUser user;
  UserViewModel({required this.user});

  String get firstName => user.firstName ?? "";
  String get lastName => user.lastName ?? "";
  String get companyName => user.companyName ?? "";
  String get mobileumber => user.mobileNumber ?? "";
  String get userId => user.userId ?? "";
  String get username => user.username ?? "";
  String get password => user.password ?? "";
  String get email => user.email ?? "";
  String get id {
    return user.id.toString();
  }
}
