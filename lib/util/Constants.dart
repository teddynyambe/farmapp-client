import 'package:intl/intl.dart';

class Constant {
  /// -----------------------------------
  ///           Keycloak constants
  /// -----------------------------------
  static const ID_PROVIDER_URI = "https://apps.infinityworx.co";
  static const AUTH0_DOMAIN = "apps.infinityworx.co";
  static const AUTH0_CLIENT_ID = "farm-app-flutter";
  static const CLIENT_SECRET = "a7eb4fef-5432-452e-95c8-b5f046559fab";

  static const AUTH0_REDIRECT_URI = "co.infinityworx.keycloak://login-callback";
  static const AUTH0_ISSUER = "https://$AUTH0_DOMAIN/auth/realms/farmapp";

  static const TOKEN_ENDPOINT =
      "/auth/realms/farmapp/protocol/openid-connect/token";
  static const USER_PROFILE_ENDPOINT =
      "/auth/realms/farmapp/protocol/openid-connect/userinfo";

  /// -----------------------------------
  ///           FarmAP APIs constants
  /// -----------------------------------
  static const FARMAPP_API_DOMAIN = "http://infinity.co:9000";

  static const USER_EP = "/user";
  static const USER_REGISTRATION_EP = "/registration";
  static const USER_UPDATE_EP = "/update";

  static const FARM_EP = "/farm";
  static const FARM_SAVE_EP = "/save";
  static const GET_ALL_FARM = "/all";

  static const SPECIE_EP = "/specie";
  static const GET_SPECIES = "/all";

  static const FARM_ACTIVITY_EP = "/livestock/activity";
  static const FARM_ACTIVITY_SAVE = "/save";
  static const FARM_ACTIVITY_GET_EP = "/all";

  ///Date and Time Formats
  ///
  static String dateTimeFormater(DateTime dateTime) {
    return DateFormat("d/M/yy H:mm").format(dateTime);
  }
}
