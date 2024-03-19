// ignore_for_file: avoid_dynamic_calls

class Student {
  Student({
   required this.profile,
   required this.studentData,
  });

  factory Student.fromJson(Map<String, dynamic> json) => Student(
        profile:  Profile.fromJson(json['profile'] as Map<String, dynamic>),
        studentData: StudentData.fromJson(json['studentData'] as Map<String, dynamic>),
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
            : List<int>.from(json['schoolRefs']!.map((int x) => x) as Iterable),
        schoolPackageRefs: json['schoolPackageRefs'] == null
            ? []
            : List<int>.from(
                json['schoolPackageRefs']!.map((int x) => x) as Iterable,),
      );

  String? city;
  String? postcode;
  List<int>? schoolRefs;
  List<int>? schoolPackageRefs;

  Map<String, dynamic> toJson() => {
        'city': city,
        'postcode': postcode,
        'schoolRefs': schoolRefs == null
            ? <int>[]
            : List<int>.from(schoolRefs!.map((x) => x)),
        'schoolPackageRefs': schoolPackageRefs == null
            ? <int>[]
            : List<int>.from(schoolPackageRefs!.map((x) => x)),
      };
}
