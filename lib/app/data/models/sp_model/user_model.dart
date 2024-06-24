import 'package:json_annotation/json_annotation.dart';
import 'package:mobile_project/app/data/models/base_model.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends BaseModel {
  final String id;
  final String name;
  final String email;
  final String photoUrl;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.photoUrl,
  });

  @override
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
