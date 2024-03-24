// ignore_for_file: avoid_dynamic_calls

class SchoolInfo {
  SchoolInfo({
    required this.id,
    required this.name,
    required this.description,
    required this.address,
    required this.city,
    required this.phoneNumber,
    required this.email,
    required this.isFeatured,
    required this.languages,
    required this.staff,
    required this.scheduleFlow,
    required this.schoolStatus,
    required this.primaryContact,
    required this.instructorSelection,
    required this.logo,
    required this.documents,
    required this.subscriptionLevel,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SchoolInfo.fromJson(Map<String, dynamic> json) => SchoolInfo(
        id: json['id'] as int,
        name: json['name'] as String,
        description: json['description'] as String,
        address: json['address'] as String,
        city: json['city'] as String,
        phoneNumber: json['phoneNumber'] as String,
        email: json['email'] as String,
        isFeatured: json['isFeatured'] as bool,
        languages:
            List<int>.from(json['languages'].map((int x) => x) as Iterable),
        staff: List<Staff>.from(
          json['staff'].map(Staff.fromJson) as Iterable,
        ),
        scheduleFlow: json['scheduleFlow'] as int,
        schoolStatus: json['schoolStatus'] as int,
        primaryContact: json['primaryContact'] as int,
        instructorSelection: json['instructorSelection'] as int,
        logo: json['logo'] as String,
        documents: List<Document>.from(
          json['documents'].map(Document.fromJson) as Iterable,
        ),
        subscriptionLevel: json['subscriptionLevel'] as int,
        createdAt: DateTime.parse(json['createdAt'] as String),
        updatedAt: DateTime.parse(json['updatedAt'] as String),
      );

  int id;
  String name;
  String description;
  String address;
  String city;
  String phoneNumber;
  String email;
  bool isFeatured;
  List<int> languages;
  List<Staff> staff;
  int scheduleFlow;
  int schoolStatus;
  int primaryContact;
  int instructorSelection;
  String logo;
  List<Document> documents;
  int subscriptionLevel;
  DateTime createdAt;
  DateTime updatedAt;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'address': address,
        'city': city,
        'phoneNumber': phoneNumber,
        'email': email,
        'isFeatured': isFeatured,
        'languages': List<dynamic>.from(languages.map((x) => x)),
        'staff': List<dynamic>.from(staff.map((x) => x.toJson())),
        'scheduleFlow': scheduleFlow,
        'schoolStatus': schoolStatus,
        'primaryContact': primaryContact,
        'instructorSelection': instructorSelection,
        'logo': logo,
        'documents': List<dynamic>.from(documents.map((x) => x.toJson())),
        'subscriptionLevel': subscriptionLevel,
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
      };
}

class Document {
  Document({
    required this.id,
    required this.key,
    required this.type,
  });

  factory Document.fromJson(Map<String, dynamic> json) => Document(
        id: json['id'] as int,
        key: json['key'] as String,
        type: json['type'] as int,
      );

  int id;
  String key;
  int type;

  Map<String, dynamic> toJson() => {
        'id': id,
        'key': key,
        'type': type,
      };
}

class Staff {
  Staff({
    required this.profile,
    required this.staffData,
  });

  factory Staff.fromJson(Map<String, dynamic> json) => Staff(
        profile: Profile.fromJson(json['profile'] as Map<String, dynamic>),
        staffData:
            StaffData.fromJson(json['staffData'] as Map<String, dynamic>),
      );

  Profile profile;
  StaffData staffData;

  Map<String, dynamic> toJson() => {
        'profile': profile.toJson(),
        'staffData': staffData.toJson(),
      };
}

class Profile {
  Profile({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
    required this.userStatus,
    required this.userType,
    required this.createdAt,
    required this.updatedAt,
    this.avatar,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json['id'] as int,
        firstName: json['firstName'] as String,
        lastName: json['lastName'] as String,
        phoneNumber: json['phoneNumber'] as String,
        email: json['email'] as String,
        avatar: json['avatar'] as String?,
        userStatus: json['userStatus'] as int,
        userType: json['userType'] as int,
        createdAt: DateTime.parse(json['createdAt'] as String),
        updatedAt: DateTime.parse(json['updatedAt'] as String),
      );

  int id;
  String firstName;
  String lastName;
  String phoneNumber;
  String email;
  String? avatar;
  int userStatus;
  int userType;
  DateTime createdAt;
  DateTime updatedAt;

  Map<String, dynamic> toJson() => {
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'phoneNumber': phoneNumber,
        'email': email,
        'avatar': avatar,
        'userStatus': userStatus,
        'userType': userType,
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
      };
}

class StaffData {
  StaffData({
    required this.id,
    required this.refId,
    required this.documents,
    required this.staffRole,
    required this.schoolId,
  });

  factory StaffData.fromJson(Map<String, dynamic> json) => StaffData(
        id: json['id'] as int,
        refId: json['refId'] as int,
        documents: List<Document>.from(
          json['documents'].map(Document.fromJson) as Iterable,
        ),
        staffRole: json['staffRole'] as int,
        schoolId: json['schoolId'] as int,
      );

  int id;
  int refId;
  List<Document> documents;
  int staffRole;
  int schoolId;

  Map<String, dynamic> toJson() => {
        'id': id,
        'refId': refId,
        'documents': List<dynamic>.from(documents.map((x) => x.toJson())),
        'staffRole': staffRole,
        'schoolId': schoolId,
      };
}
