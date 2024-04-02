// ignore_for_file: avoid_dynamic_calls

class Student {
  Student({
    required this.profile,
    required this.studentData,
  });

  factory Student.fromJson(Map<String, dynamic> json) => Student(
        profile: Profile.fromJson(json['profile'] as Map<String, dynamic>),
        studentData:
            StudentData.fromJson(json['studentData'] as Map<String, dynamic>),
      );

  Profile profile;
  StudentData studentData;

  Map<String, dynamic> toJson() => {
        'profile': profile.toJson(),
        'studentData': studentData.toJson(),
      };
}

class Profile {
  Profile({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
    required this.avatar,
    required this.userStatus,
    required this.userType,
    this.createdAt,
    this.updatedAt,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json['id'] as int,
        firstName: json['firstName'] as String,
        lastName: json['lastName'] as String,
        phoneNumber: json['phoneNumber'] as String,
        email: json['email'] as String,
        avatar: json['avatar'] as String,
        userStatus: json['userStatus'] as int,
        userType: json['userType'] as int,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
      );

  int id;
  String firstName;
  String lastName;
  String phoneNumber;
  String email;
  String avatar;
  int userStatus;
  int userType;
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
    required this.city,
    required this.postcode,
    required this.schoolRefs,
    required this.createdAt,
    required this.updatedAt,
  });

  factory StudentData.fromJson(Map<String, dynamic> json) => StudentData(
        city: json['city'] as String,
        postcode: json['postcode'] as String,
        schoolRefs: List<SchoolRef>.from(
            json['schoolRefs'].map(SchoolRef.fromJson) as Iterable,),
        createdAt: DateTime.parse(json['createdAt'] as String),
        updatedAt: DateTime.parse(json['updatedAt'] as String),
      );

  String city;
  String postcode;
  List<SchoolRef> schoolRefs;
  DateTime createdAt;
  DateTime updatedAt;

  Map<String, dynamic> toJson() => {
        'city': city,
        'postcode': postcode,
        'schoolRefs': List<dynamic>.from(schoolRefs.map((x) => x.toJson())),
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
      };
}

class SchoolRef {
  SchoolRef({
    required this.studentId,
    required this.schoolId,
    required this.totalHrs,
    required this.totalKms,
    required this.updatedAt,
  });

  factory SchoolRef.fromJson(Map<String, dynamic> json) => SchoolRef(
        studentId: json['studentId'] as int,
        schoolId: json['schoolId'] as int,
        totalHrs: json['totalHrs'] as int,
        totalKms: json['totalKms'] as int,
        updatedAt: DateTime.parse(json['updatedAt'] as String),
      );

  int studentId;
  int schoolId;
  int totalHrs;
  int totalKms;
  DateTime updatedAt;

  Map<String, dynamic> toJson() => {
        'studentId': studentId,
        'schoolId': schoolId,
        'totalHrs': totalHrs,
        'totalKms': totalKms,
        'updatedAt': updatedAt.toIso8601String(),
      };
}
