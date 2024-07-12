import 'package:json_annotation/json_annotation.dart';
import 'package:mobile_project/app/data/models/base_model.dart';
part 'artist_model.g.dart';

@JsonSerializable()
class ArtistModel extends BaseModel {
  final String id;
  final String name;
  final String imageUrl;

  ArtistModel({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  @override
  Map<String, dynamic> toJson() => _$ArtistModelToJson(this);
  factory ArtistModel.fromJson(Map<String, dynamic> json) =>
      _$ArtistModelFromJson(json);
}
