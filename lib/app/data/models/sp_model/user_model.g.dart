// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      photoUrl: json['photoUrl'] as String,
      password: json['password'] as String,
      nameHash: json['nameHash'] as String,
      subscriptionType: json['subscriptionType'] as String,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'nameHash': instance.nameHash,
      'email': instance.email,
      'photoUrl': instance.photoUrl,
      'password': instance.password,
      'subscriptionType': instance.subscriptionType,
    };
