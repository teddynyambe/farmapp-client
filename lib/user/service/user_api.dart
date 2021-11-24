import 'dart:convert';
import 'package:farmapp_mobile/user/model/farmapp_user.dart';
import 'package:farmapp_mobile/util/Constants.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class UserAPI {
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  Future<Map<String, dynamic>> loginUser(
      String username, String password) async {
    final headers = {"Content-Type": "application/x-www-form-urlencoded"};

    final body = {
      "client_id": Constant.AUTH0_CLIENT_ID,
      "username": username,
      "password": password,
      "grant_type": "password",
      "client_secret": Constant.CLIENT_SECRET
    };

    final response = await http.post(
      Uri.parse(Constant.ID_PROVIDER_URI + Constant.TOKEN_ENDPOINT),
      headers: headers,
      body: body,
    );
    if (response.statusCode == 401) {
      throw Exception("Login failed");
    }
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      final profile =
          await _getKeycloakUserDetails(result['access_token'] ?? "");
      await secureStorage.write(
          key: "refresh_token", value: result['refresh_token']);
      await secureStorage.write(key: "token", value: result['access_token']);
      return profile;
    } else {
      throw Exception("Login failed");
    }
  }

  Future<Map<String, dynamic>> _getKeycloakUserDetails(
      String accessToken) async {
    final response = await http.get(
        Uri.parse(Constant.ID_PROVIDER_URI + Constant.USER_PROFILE_ENDPOINT),
        headers: {'Authorization': 'Bearer $accessToken'});

    if (response.statusCode == 200) {
      final user =
          getUserOnFarmAppServer(accessToken, jsonDecode(response.body)["sub"]);

      return user;
    } else {
      throw Exception(
          "Failed to get user details from keycloak Identity server");
    }
  }

  Future<Map<String, dynamic>> getUserOnFarmAppServer(
      String accessToken, String userId) async {
    final response = await http.get(
        Uri.parse(
            Constant.FARMAPP_API_DOMAIN + Constant.USER_EP + "/" + userId),
        headers: {'Authorization': 'Bearer $accessToken'});
    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      final data = decoded["results"];
      return data[0];
    } else {
      throw Exception("Error accessing user on local FarmApp server");
    }
  }

  Future<bool> registerUser(FarmAppUser user) async {
    final data = jsonEncode(user.toJson());
    final headers = {"Content-Type": "application/json"};
    final response = await http.post(
        Uri.parse(
          Constant.FARMAPP_API_DOMAIN +
              Constant.USER_EP +
              Constant.USER_REGISTRATION_EP,
        ),
        body: data,
        headers: headers);
    if (response.statusCode == 201) {
      return true;
    } else if (response.statusCode == 409) {
      throw Exception("Registration failed - User exist");
    } else {
      throw Exception("Registration failed - Unknown error");
    }
  }

  Future<bool> saveUserOnFarmServer(
      FarmAppUser user, String accessToken) async {
    final data = jsonEncode(user);
    final headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $accessToken"
    };
    final response = await http.put(
        Uri.parse(Constant.FARMAPP_API_DOMAIN +
            Constant.USER_EP +
            Constant.USER_UPDATE_EP),
        headers: headers,
        body: data);
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception("failed to update user details");
    }
  }

  Future<bool> logout() async {
    secureStorage.deleteAll();
    return true;
  }
}
