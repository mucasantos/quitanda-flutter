// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      fullname: json['fullname'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      cpf: json['cpf'] as String?,
      password: json['password'] as String?,
      id: json['id'] as String?,
      sessionToken: json['sessionToken'] as String?,
      username: json['username'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'fullname': instance.fullname,
      'email': instance.email,
      'username': instance.username,
      'phone': instance.phone,
      'cpf': instance.cpf,
      'password': instance.password,
      'id': instance.id,
      'sessionToken': instance.sessionToken,
    };
