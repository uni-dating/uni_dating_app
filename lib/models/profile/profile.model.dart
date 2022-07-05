//@JsonSerializable()

enum Faculty {
  INF, TEC, AC, ESB, TD, None
}
enum Degree {
  Bachelor, Master, None
}

class Link {
  late String linkTitle;
  late String link;

  Link(String linkTitle, String link) {
    this.linkTitle = linkTitle;
    this.link = link;
  }
}

class ProfileModel {
   ProfileModel({
    this.id,
    this.username,
    this.school,
    this.firstName,
    this.lastName,
    this.bio,
    required this.links,
    this.faculty,
    this.degree,
    this.dateOfBirth,
    this.imageLocation
  });

  //@JsonKey(required: true, includeIfNull: false)
  final int? id;
  final String? username;
  late String? school;
  late String? firstName;//
  late String? lastName;//
  late String? bio;//
  late List<Link>links ; //
  late Faculty? faculty; //
  late Degree? degree; //
  late DateTime? dateOfBirth; //
  late String? imageLocation;

  void setFirstName(String fName){
    this.firstName = fName;
  }

  void setLastName(String lName){
    this.lastName = lName;
  }
  void setBio(String bio){
    this.bio = bio;
  }
   void setLinks(List<Link> links){
     this.links = links;
   }

   void setFaculty(Faculty faculty){
     this.faculty = faculty;
   }

   void setDegree(Degree degree){
     this.degree = degree;
   }

   void setBirthDate(DateTime birtDate){
     this.dateOfBirth = birtDate;
   }

   void setImageLocation(String location){
    this.imageLocation = location;
   }

  ProfileModel copyWith({
    int? id,
    String? username,
    String? school,
  }) {
    return ProfileModel(
      id: id,
      username: username,
      school: school,
      links: [],
    );
  }

  // factory PostModel.fromJson(Map<String, dynamic> json) =>
  //     _$PostModelFromJson(json);
  //
  // Map<String, dynamic> toJson() => _$PostModelToJson(this);
}