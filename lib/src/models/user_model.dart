import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  String? fullname;
  String? email;
  String? phone;
  String? cpf;
  String? password;
  String? id;
  String? sessionToken;
  UserModel({
    this.fullname,
    this.email,
    this.phone,
    this.cpf,
    this.password,
    this.id,
    this.sessionToken,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
