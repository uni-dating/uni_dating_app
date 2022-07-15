import 'package:json_annotation/json_annotation.dart';

part 'user.info.model.g.dart';

enum Faculty { INF, TEC, AC, ESB, TD, None }

enum Degree { Bachelor, Master, None }

@JsonSerializable()
class Link {
  late String linkTitle;
  late String link;

  Link(String linkTitle, String link) {
    this.linkTitle = linkTitle;
    this.link = link;
  }

  factory Link.fromJson(Map<String, dynamic> json) => _$LinkFromJson(json);

  Map<String, dynamic> toJson() => _$LinkToJson(this);
}

@JsonSerializable()
class UserInfoModel {
  UserInfoModel({
    this.email,
    this.password,
    required this.id,
    this.username,
    this.school,
    this.firstName,
    this.lastName,
    this.bio,
    required this.links,
    this.faculty,
    this.degree,
    this.dateOfBirth,
    this.imageLocation,
  });

  //@JsonKey(required: true, includeIfNull: false)
  final String id;
  final String? username;
  late String? email;
  late String? password;
  late String? school;
  late String? firstName;
  late String? lastName;
  late String? bio;
  late List<Link> links;

  late Faculty? faculty;
  late Degree? degree;
  late DateTime? dateOfBirth;
  late String? imageLocation;

  void setFirstName(String fName) {
    this.firstName = fName;
  }

  void setLastName(String lName) {
    this.lastName = lName;
  }

  void setBio(String bio) {
    this.bio = bio;
  }

  void setLinks(List<Link> links) {
    this.links = links;
  }

  void setFaculty(Faculty faculty) {
    this.faculty = faculty;
  }

  void setDegree(Degree degree) {
    this.degree = degree;
  }

  void setBirthDate(DateTime birtDate) {
    this.dateOfBirth = birtDate;
  }

  void setImageLocation(String location) {
    this.imageLocation = location;
  }

  void setEmail(String email) {
    this.email = email;
  }

  void setPassword(String password) {
    this.password = password;
  }

  UserInfoModel copyWith({
    required String id,
    String? username,
    String? school,
  }) {
    return UserInfoModel(
      id: id,
      username: username,
      school: school,
      links: [],
    );
  }

  factory UserInfoModel.fromJson(Map<String, dynamic> json) =>
      _$UserInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoModelToJson(this);
}
