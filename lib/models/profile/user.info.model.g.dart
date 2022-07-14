// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.info.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Link _$LinkFromJson(Map<String, dynamic> json) => Link(
      json['linkTitle'] as String,
      json['link'] as String,
    );

Map<String, dynamic> _$LinkToJson(Link instance) => <String, dynamic>{
      'linkTitle': instance.linkTitle,
      'link': instance.link,
    };

UserInfoModel _$UserInfoModelFromJson(Map<String, dynamic> json) =>
    UserInfoModel(
      id: json['id'] as String,
      username: json['username'] as String?,
      school: json['school'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      bio: json['bio'] as String?,
      links: (json['links'] as List<dynamic>)
          .map((e) => Link.fromJson(e as Map<String, dynamic>))
          .toList(),
      faculty: $enumDecodeNullable(_$FacultyEnumMap, json['faculty']),
      degree: $enumDecodeNullable(_$DegreeEnumMap, json['degree']),
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : DateTime.parse(json['dateOfBirth'] as String),
      imageLocation: json['imageLocation'] as String?,
    );

Map<String, dynamic> _$UserInfoModelToJson(UserInfoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'school': instance.school,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'bio': instance.bio,
      'links': instance.links,
      'faculty': _$FacultyEnumMap[instance.faculty],
      'degree': _$DegreeEnumMap[instance.degree],
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'imageLocation': instance.imageLocation,
    };

const _$FacultyEnumMap = {
  Faculty.INF: 'INF',
  Faculty.TEC: 'TEC',
  Faculty.AC: 'AC',
  Faculty.ESB: 'ESB',
  Faculty.TD: 'TD',
  Faculty.None: 'None',
};

const _$DegreeEnumMap = {
  Degree.Bachelor: 'Bachelor',
  Degree.Master: 'Master',
  Degree.None: 'None',
};
