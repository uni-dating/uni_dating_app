//@JsonSerializable()
class ProfileModel {
  const ProfileModel({
    this.id,
    this.username,
    this.school,
  });

  //@JsonKey(required: true, includeIfNull: false)
  final int? id;
  final String? username;
  final String? school;

  ProfileModel copyWith({
    int? id,
    String? username,
    String? school,
  }) {
    return ProfileModel(
      id: id,
      username: username,
      school: school,
    );
  }

  // factory PostModel.fromJson(Map<String, dynamic> json) =>
  //     _$PostModelFromJson(json);
  //
  // Map<String, dynamic> toJson() => _$PostModelToJson(this);
}