import 'package:json_annotation/json_annotation.dart';
import 'package:mobile_project/app/data/models/base_model.dart';
part 'playlist_model.g.dart';

@JsonSerializable()
class PlaylistModel extends BaseModel {
  final String id;
  final String name;
  final String imageUrl;

  PlaylistModel({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  @override
  Map<String, dynamic> toJson() => _$PlaylistModelToJson(this);
  factory PlaylistModel.fromJson(Map<String, dynamic> json) =>
      _$PlaylistModelFromJson(json);
}
