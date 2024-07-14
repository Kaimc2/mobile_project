// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'podcast_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PodcastModel _$PodcastModelFromJson(Map<String, dynamic> json) => PodcastModel(
      id: json['id'] as String,
      imagePath: json['imagePath'] as String,
      title: json['title'] as String,
      podcastName: json['podcastName'] as String,
      releaseDate: json['releaseDate'] as String,
      duration: (json['duration'] as num).toInt(),
      description: json['description'] as String,
      preview: json['preview'] as String?,
    );

Map<String, dynamic> _$PodcastModelToJson(PodcastModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imagePath': instance.imagePath,
      'title': instance.title,
      'podcastName': instance.podcastName,
      'releaseDate': instance.releaseDate,
      'duration': instance.duration,
      'description': instance.description,
      'preview': instance.preview,
    };
