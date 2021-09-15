import 'package:farmapp_mobile/enums/roles.dart';
import 'package:farmapp_mobile/user/model/farmapp_user.dart';
import 'package:farmapp_mobile/user/service/user_api.dart';
import 'package:farmapp_mobile/user/view_model/user_viewmodel.dart';
import 'package:flutter/cupertino.dart';

class UserRegistrationViewModel extends ChangeNotifier {
  FarmAppUser _user = FarmAppUser();
  UserViewModel? _userViewModel;
  var isUpdated = false;
  var isLoggedIn = false;
  var isBusy = false;
  var error = "";
  var _accessToken = "";

  String? firstName;
  String? lastName;
  String? companyName;
  String? email;
  String? mobileNumber;
  String? username;
  String? password;
  String? passwordConfirm;
  String? userId;
  String? id;

  Future<void> loginUser(username, password) async {
    isBusy = true;
    notifyListeners();
    try {
      final profile = await UserAPI().loginUser(username, password);
      _user = FarmAppUser.fromJson(profile);
      _userViewModel = UserViewModel(user: _user);
      isBusy = false;
      isLoggedIn = true;
      notifyListeners();
    } catch (e) {
      error = e.toString();
      isBusy = false;
      isLoggedIn = false;
      notifyListeners();
    }
  }

  Future<void> registerUser() async {
    isBusy = true;
    print(
        "$companyName, $email, $firstName, $lastName, $mobileNumber, $password, $username, $userId");
    notifyListeners();
    final response = await UserAPI().registerUser(FarmAppUser(
      companyName: companyName,
      email: email,
      firstName: firstName,
      lastName: lastName,
      mobileNumber: mobileNumber,
      password: password,
      role: Roles.Owner,
      username: username,
    ));
    isUpdated = response;
    isBusy = false;
    notifyListeners();
  }

  Future<void> saveOnFarmAppServer() async {
    isBusy = true;
    notifyListeners();
    isUpdated = await UserAPI().saveUserOnFarmServer(
        FarmAppUser(
            companyName: companyName,
            email: email,
            firstName: firstName,
            lastName: lastName,
            mobileNumber: mobileNumber,
            role: Roles.Owner,
            userId: userId,
            id: id),
        _accessToken);
    isBusy = false;
    notifyListeners();
  }

  Future<void> getUserOnFarmAppServer(String userId) async {
    final user = await UserAPI().getUserOnFarmAppServer(_accessToken, userId);
    _user = FarmAppUser.fromJson(user);
    _userViewModel = UserViewModel(user: _user);
    notifyListeners();
  }

  _clearObject() {
    firstName = "";
    lastName = "";
    companyName = "";
    email = "";
    mobileNumber = "";
    username = "";
    password = "";
    passwordConfirm = "";
    userId = "";
    id = "";
    _accessToken = "";
    _user = FarmAppUser();
    _userViewModel = UserViewModel(user: _user);
  }

  Future<void> logout() async {
    if (await UserAPI().logout()) {
      isLoggedIn = false;
      _clearObject();
      notifyListeners();
    }
  }

  FarmAppUser get user => _user;
  UserViewModel? get userViewModel => _userViewModel;
}
