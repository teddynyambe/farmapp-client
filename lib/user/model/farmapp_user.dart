import 'package:farmapp_mobile/enums/roles.dart';
import 'package:json_annotation/json_annotation.dart';
part 'farmapp_user.g.dart';

@JsonSerializable()
class FarmAppUser {
  @JsonKey(name: "id")
  final id;
  @JsonKey(name: 'userId')
  final userId;
  @JsonKey(name: 'firstName')
  final firstName;
  @JsonKey(name: 'lastName')
  final lastName;
  @JsonKey(name: 'username')
  final username;
  @JsonKey(name: "mobileNumber")
  final mobileNumber;
  @JsonKey(name: 'emailAddress')
  final email;
  @JsonKey(name: 'password')
  final password;
  @JsonKey(name: 'role')
  Roles role;
  @JsonKey(name: "companyName")
  final companyName;
  FarmAppUser(
      {this.id,
      this.userId,
      this.firstName,
      this.lastName,
      this.username,
      this.mobileNumber,
      this.password,
      this.email,
      this.companyName,
      this.role = Roles.Owner});

  factory FarmAppUser.fromJson(Map<String, dynamic> json) =>
      _$FarmAppUserFromJson(json);
  Map<String, dynamic> toJson() => _$FarmAppUserToJson(this);
}
