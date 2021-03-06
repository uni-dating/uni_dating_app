import 'package:json_annotation/json_annotation.dart';

part 'news.model.g.dart';

@JsonSerializable()
class NewsModel {
  const NewsModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.description,
    required this.timePosted,
    required this.userName,
    required this.userPhoto,
  });

  final String id;
  final String userId;
  final String userName;
  final String userPhoto;

  final String title;
  final String description;
  final DateTime timePosted;

  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewsModelToJson(this);
}
