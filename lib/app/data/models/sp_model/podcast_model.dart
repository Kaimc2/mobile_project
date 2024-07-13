import 'package:json_annotation/json_annotation.dart';
import 'package:mobile_project/app/data/models/base_model.dart';
part 'podcast_model.g.dart';

@JsonSerializable()
class PodcastModel extends BaseModel {
  final String id;
  final String imagePath;
  final String title;
  final String podcastName;
  final String releaseDate;
  final int duration;
  final String description;
  final String? preview;

  PodcastModel({
    required this.id,
    required this.imagePath,
    required this.title,
    required this.podcastName,
    required this.releaseDate,
    required this.duration,
    required this.description,
    this.preview,
  });

  @override
  Map<String, dynamic> toJson() => _$PodcastModelToJson(this);
  factory PodcastModel.fromJson(Map<String, dynamic> json) =>
      _$PodcastModelFromJson(json);
}
