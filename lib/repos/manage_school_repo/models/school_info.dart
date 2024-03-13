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
    required this.staff,
    this.isFeatured,
    this.languages,
    this.scheduleFlow,
    this.schoolStatus,
    this.primaryContact,
    this.instructorSelection,
    this.logo,
    this.vehicles,
    this.schoolLocations,
    this.documents,
    this.subscriptionLevel,
    this.createdAt,
    this.updatedAt,
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
        languages: json['languages'] == null
            ? []
            : List<int>.from(json['languages']!.map((int x) => x) as Iterable),
        staff: json['staff'] == null
            ? []
            : List<Staff>.from(
                json['staff']!.map(Staff.fromJson) as Iterable,),
        scheduleFlow: json['scheduleFlow'] as int?,
        schoolStatus: json['schoolStatus'] as int?,
        primaryContact: json['primaryContact'] as int?,
        instructorSelection: json['instructorSelection'] as int?,
        logo: json['logo'] as String?,
        vehicles: json['vehicles'] == null
            ? []
            : List<Vehicle>.from(
                json['vehicles']!.map(Vehicle.fromJson) as Iterable,),
        schoolLocations: json['schoolLocations'] == null
            ? []
            : List<SchoolLocation>.from(json['schoolLocations']!
                .map(SchoolLocation.fromJson) as Iterable,),
        documents: json['documents'] == null
            ? []
            : List<Document>.from(json['documents']!
                .map(Document.fromJson) as Iterable,),
        subscriptionLevel: json['subscriptionLevel'] as int?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
      );

  int id;
  String name;
  String description;
  String address;
  String city;
  String phoneNumber;
  String email;
  bool? isFeatured;
  List<int>? languages;
  List<Staff> staff;
  int? scheduleFlow;
  int? schoolStatus;
  int? primaryContact;
  int? instructorSelection;
  String? logo;
  List<Vehicle>? vehicles;
  List<SchoolLocation>? schoolLocations;
  List<Document>? documents;
  int? subscriptionLevel;
  DateTime? createdAt;
  DateTime? updatedAt;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'address': address,
        'city': city,
        'phoneNumber': phoneNumber,
        'email': email,
        'isFeatured': isFeatured,
        'languages': languages == null
            ? <int>[]
            : List<int>.from(languages!.map((x) => x)),
        'staff': List<Staff>.from(staff.map((x) => x.toJson())),
        'scheduleFlow': scheduleFlow,
        'schoolStatus': schoolStatus,
        'primaryContact': primaryContact,
        'instructorSelection': instructorSelection,
        'logo': logo,
        'vehicles': vehicles == null
            ? <Vehicle>[]
            : List<Vehicle>.from(vehicles!.map((x) => x.toJson())),
        'schoolLocations': schoolLocations == null
            ? <SchoolLocation>[]
            : List<SchoolLocation>.from(schoolLocations!.map((x) => x.toJson())),
        'documents': documents == null
            ? <Document>[]
            : List<Document>.from(documents!.map((x) => x.toJson())),
        'subscriptionLevel': subscriptionLevel,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
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

class SchoolLocation {
  SchoolLocation({
    required this.id,
    required this.name,
    required this.address,
    required this.city,
    required this.isActive,
    this.postalCode,
    this.locationType,
    this.landmark,
  });

  factory SchoolLocation.fromJson(Map<String, dynamic> json) => SchoolLocation(
        id: json['id'] as int,
        name: json['name'] as String,
        address: json['address'] as String,
        city: json['city'] as String,
        postalCode: json['postalCode'] as String?,
        locationType: json['locationType'] as int?,
        landmark: json['landmark'] as String?,
        isActive: json['isActive'] as bool,
      );

  int id;
  String name;
  String address;
  String city;
  String? postalCode;
  int? locationType;
  String? landmark;
  bool isActive;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'address': address,
        'city': city,
        'postalCode': postalCode,
        'locationType': locationType,
        'landmark': landmark,
        'isActive': isActive,
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
    this.avatar,
    this.userStatus,
    this.userType,
    this.createdAt,
    this.updatedAt,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json['id'] as int,
        firstName: json['firstName'] as String,
        lastName: json['lastName'] as String,
        phoneNumber: json['phoneNumber'] as String,
        email: json['email'] as String,
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

  int id;
  String firstName;
  String lastName;
  String phoneNumber;
  String email;
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

class StaffData {
  StaffData({
    required this.id,
    required this.userProfileId,
    required this.documents,
    required this.staffRole,
    required this.schoolId,
  });

  factory StaffData.fromJson(Map<String, dynamic> json) => StaffData(
        id: json['id'] as int,
        userProfileId: json['userProfileId'] as int,
        documents: json['documents'] == null
            ? []
            : List<Document>.from(json['documents']!
                .map(Document.fromJson) as Iterable,),
        staffRole: json['staffRole'] as int,
        schoolId: json['schoolId'] as int,
      );

  int id;
  int userProfileId;
  List<Document> documents;
  int staffRole;
  int schoolId;

  Map<String, dynamic> toJson() => {
        'id': id,
        'userProfileId': userProfileId,
        'documents': List<dynamic>.from(documents.map((x) => x.toJson())),
        'staffRole': staffRole,
        'schoolId': schoolId,
      };
}

class Vehicle {
  Vehicle({
    required this.id,
    required this.name,
    this.description,
    this.transmission,
    this.year,
    this.images,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
        id: json['id'] as int,
        name: json['name'] as String,
        description: json['description'] as String?,
        transmission: json['transmission'] as String?,
        year: json['year'] as String?,
        images: json['images'] == null
            ? []
            : List<VehicleImage>.from(
                json['images']!.map(VehicleImage.fromJson) as Iterable,
              ),
      );

  int id;
  String name;
  String? description;
  String? transmission;
  String? year;
  List<VehicleImage>? images;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'transmission': transmission,
        'year': year,
        'images': images == null
            ? <VehicleImage>[]
            : List<VehicleImage>.from(images!.map((x) => x.toJson())),
      };
}

class VehicleImage {
  VehicleImage({
    required this.id,
    required this.imageKey,
  });

  factory VehicleImage.fromJson(Map<String, dynamic> json) => VehicleImage(
        id: json['id'] as int,
        imageKey: json['imageKey'] as String,
      );

  int id;
  String imageKey;

  Map<String, dynamic> toJson() => {
        'id': id,
        'imageKey': imageKey,
      };
}
