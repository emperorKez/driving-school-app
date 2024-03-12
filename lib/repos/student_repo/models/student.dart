class Student {
  Student({
    this.profile,
    this.studentData,
  });

  factory Student.fromJson(Map<String, dynamic> json) => Student(
        profile: json['profile'] == null
            ? null
            : Profile.fromJson(json['profile'] as Map<String, dynamic>),
        studentData: json['studentData'] == null
            ? null
            : StudentData.fromJson(json['studentData'] as Map<String, dynamic>),
      );

  Profile? profile;
  StudentData? studentData;

  Map<String, dynamic> toJson() => {
        'profile': profile?.toJson(),
        'studentData': studentData?.toJson(),
      };
}

class Profile {
  Profile({
    this.id,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.email,
    this.avatar,
    this.userStatus,
    this.userType,
    this.createdAt,
    this.updatedAt,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json['id'] as int?,
        firstName: json['firstName'] as String?,
        lastName: json['lastName'] as String?,
        phoneNumber: json['phoneNumber'] as String?,
        email: json['email'] as String?,
        avatar: json['avatar'] as String?,
        userStatus: json['userStatus'] as int?,
        userType: json['userType'] as int?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
      );

  int? id;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? email;
  String? avatar;
  int? userStatus;
  int? userType;
  DateTime? createdAt;
  DateTime? updatedAt;

  Map<String, dynamic> toJson() => {
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'phoneNumber': phoneNumber,
        'email': email,
        'avatar': avatar,
        'userStatus': userStatus,
        'userType': userType,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
      };
}

class StudentData {
  StudentData({
    this.city,
    this.postcode,
    this.schoolRefs,
    this.schoolPackageRefs,
  });

  factory StudentData.fromJson(Map<String, dynamic> json) => StudentData(
        city: json['city'] as String,
        postcode: json['postcode'] as String,
        schoolRefs: json['schoolRefs'] == null
            ? []
            : List<int>.from(json['schoolRefs']!.map((x) => x) as Iterable),
        schoolPackageRefs: json['schoolPackageRefs'] == null
            ? []
            : List<int>.from(
                json['schoolPackageRefs']!.map((x) => x) as Iterable,),
      );

  String? city;
  String? postcode;
  List<int>? schoolRefs;
  List<int>? schoolPackageRefs;

  Map<String, dynamic> toJson() => {
        'city': city,
        'postcode': postcode,
        'schoolRefs': schoolRefs == null
            ? []
            : List<dynamic>.from(schoolRefs!.map((x) => x)),
        'schoolPackageRefs': schoolPackageRefs == null
            ? []
            : List<dynamic>.from(schoolPackageRefs!.map((x) => x)),
      };
}
