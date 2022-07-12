// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsModel _$NewsModelFromJson(Map<String, dynamic> json) => NewsModel(
      id: json['id'] as String,
      userId: json['userId'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      timePosted: DateTime.parse(json['timePosted'] as String),
      userName: json['userName'] as String,
      userPhoto: json['userPhoto'] as String,
    );

Map<String, dynamic> _$NewsModelToJson(NewsModel instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'userName': instance.userName,
      'userPhoto': instance.userPhoto,
      'title': instance.title,
      'description': instance.description,
      'timePosted': instance.timePosted.toIso8601String(),
    };
