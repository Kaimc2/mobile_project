import 'package:json_annotation/json_annotation.dart';
import 'package:mobile_project/app/data/models/base_model.dart';
part 'music_model.g.dart';

@JsonSerializable()
class MusicModel extends BaseModel {
  final String id;
  final String name;
  final String imageUrl;
  final String? subtitle;

  MusicModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    this.subtitle,
  });

  @override
  Map<String, dynamic> toJson() => _$MusicModelToJson(this);
  factory MusicModel.fromJson(Map<String, dynamic> json) =>
      _$MusicModelFromJson(json);
}

@JsonSerializable()
class MusicCardModel extends BaseModel {
  final String id;
  final String name;
  final String mixImageUrl;
  final String bgImageUrl;
  final String description;
  final String? category;
  final String? preview;

  MusicCardModel({
    required this.id,
    required this.name,
    required this.mixImageUrl,
    required this.bgImageUrl,
    required this.description,
    this.category,
    this.preview,
  });

  @override
  Map<String, dynamic> toJson() => _$MusicCardModelToJson(this);
  factory MusicCardModel.fromJson(Map<String, dynamic> json) =>
      _$MusicCardModelFromJson(json);
}
