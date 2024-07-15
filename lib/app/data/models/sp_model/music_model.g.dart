// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MusicModel _$MusicModelFromJson(Map<String, dynamic> json) => MusicModel(
      id: json['id'] as String,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      subtitle: json['subtitle'] as String?,
      author: json['author'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$MusicModelToJson(MusicModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'subtitle': instance.subtitle,
      'author': instance.author,
      'type': instance.type,
    };

MusicCardModel _$MusicCardModelFromJson(Map<String, dynamic> json) =>
    MusicCardModel(
      id: json['id'] as String,
      name: json['name'] as String,
      mixImageUrl: json['mixImageUrl'] as String,
      bgImageUrl: json['bgImageUrl'] as String,
      description: json['description'] as String,
      category: json['category'] as String?,
      preview: json['preview'] as String?,
    );

Map<String, dynamic> _$MusicCardModelToJson(MusicCardModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'mixImageUrl': instance.mixImageUrl,
      'bgImageUrl': instance.bgImageUrl,
      'description': instance.description,
      'category': instance.category,
      'preview': instance.preview,
    };
