// ignore_for_file: avoid_dynamic_calls

class DrivingSchool {
  DrivingSchool({
    this.schoolInfo,
    this.lessons,
    this.packages,
    this.reviews,
    this.staff,
  });

  factory DrivingSchool.fromJson(Map<String, dynamic> json) => DrivingSchool(
        schoolInfo: json['school'] == null
            ? null
            : SchoolInfo.fromJson(json['school'] as Map<String, dynamic>),
        lessons: json['groupLessons'] == null
            ? []
            : List<Lesson>.from(
                json['groupLessons']!.map(Lesson.fromJson) as Iterable,),
        packages: json['packages'] == null
            ? []
            : List<Package>.from(
                json['packages']!.map(Package.fromJson) as Iterable,),
        reviews: json['reviews'] == null
            ? []
            : List<Review>.from(
                json['reviews']!.map(Review.fromJson) as Iterable,),
        staff: json['staff'] == null
            ? []
            : List<Staff>.from(json['staff']!.map(Staff.fromJson) as Iterable),
      );

  SchoolInfo? schoolInfo;
  List<Lesson>? lessons;
  List<Package>? packages;
  List<Review>? reviews;
  List<Staff>? staff;

  Map<String, dynamic> toJson() => {
        'school': schoolInfo?.toJson(),
        'groupLessons': lessons == null
            ? <Lesson>[]
            : List<Lesson>.from(lessons!.map((x) => x.toJson())),
        'packages': packages == null
            ? <Package>[]
            : List<Package>.from(packages!.map((x) => x.toJson())),
        'reviews': reviews == null
            ? <Review>[]
            : List<Review>.from(reviews!.map((x) => x.toJson())),
        'staff': staff == null
            ? <Staff>[]
            : List<Staff>.from(staff!.map((x) => x.toJson())),
      };
}

class Lesson {
  Lesson({
    required this.id,
    required this.title,
    required this.description,
    required this.languageId,
    required this.price,
    required this.schoolId,
    required this.groupLessons,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) => Lesson(
        id: json['id'] as int,
        title: json['title'] as String,
        description: json['description'] as String,
        languageId: json['languageId'] as int,
        price: json['price'] as int,
        schoolId: json['schoolId'] as int,
        groupLessons: List<GroupLesson>.from(
          json['groupLessons']!.map(GroupLesson.fromJson) as Iterable,
        ),
      );

  int id;
  String title;
  String description;
  int languageId;
  int price;
  int schoolId;
  List<GroupLesson> groupLessons;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'languageId': languageId,
        'price': price,
        'schoolId': schoolId,
        'groupLessons': List<dynamic>.from(groupLessons.map((x) => x.toJson())),
      };
}

class GroupLesson {
  GroupLesson({
    required this.id,
    required this.locationId,
    required this.staffId,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.seats,
    required this.lessonStatus,
    required this.groupLessonStudentRefs,
  });

  factory GroupLesson.fromJson(Map<String, dynamic> json) => GroupLesson(
        id: json['id'] as int,
        locationId: json['locationId'] as int,
        staffId: json['staffId'] as int,
        date: DateTime.parse(json['date'] as String),
        startTime:
            LessonTime.fromJson(json['startTime'] as Map<String, dynamic>),
        endTime: LessonTime.fromJson(json['endTime'] as Map<String, dynamic>),
        seats: json['seats'] as int,
        lessonStatus: json['lessonStatus'] as int,
        groupLessonStudentRefs: List<int>.from(
          json['groupLessonStudentRefs']!.map((dynamic x) => x) as Iterable,
        ),
      );

  int id;
  int locationId;
  int staffId;
  DateTime date;
  LessonTime startTime;
  LessonTime endTime;
  int seats;
  int lessonStatus;
  List<int> groupLessonStudentRefs;

  Map<String, dynamic> toJson() => {
        'id': id,
        'locationId': locationId,
        'staffId': staffId,
        'date': date.toIso8601String(),
        'startTime': startTime.toJson(),
        'endTime': endTime.toJson(),
        'seats': seats,
        'lessonStatus': lessonStatus,
        'groupLessonStudentRefs':
            List<dynamic>.from(groupLessonStudentRefs.map((x) => x)),
      };
}

class LessonTime {
  LessonTime({
    this.hour,
    this.minute,
    this.second,
    this.nano,
  });

  factory LessonTime.fromJson(Map<String, dynamic> json) => LessonTime(
        hour: json['hour'] as int,
        minute: json['minute'] as int,
        second: json['second'] as int,
        nano: json['nano'] as int,
      );

  int? hour;
  int? minute;
  int? second;
  int? nano;

  Map<String, dynamic> toJson() => {
        'hour': hour,
        'minute': minute,
        'second': second,
        'nano': nano,
      };
}

class Package {
  Package({
    required this.schoolPackage,
    this.offer,
    this.endDate,
    this.discountedPrice,
  });

  factory Package.fromJson(Map<String, dynamic> json) => Package(
        schoolPackage: SchoolPackage.fromJson(
          json['schoolPackage'] as Map<String, dynamic>,
        ),
        offer: json['offer'] as int,
        endDate: json['endDate'] == null
            ? null
            : DateTime.parse(json['endDate'] as String),
        discountedPrice: json['discountedPrice'] as int,
      );

  SchoolPackage schoolPackage;
  int? offer;
  DateTime? endDate;
  int? discountedPrice;

  Map<String, dynamic> toJson() => {
        'schoolPackage': schoolPackage.toJson(),
        'offer': offer,
        'endDate': endDate?.toIso8601String(),
        'discountedPrice': discountedPrice,
      };
}

class SchoolPackage {
  SchoolPackage({
    required this.id,
    required this.title,
    required this.description,
    required this.details,
    required this.timeDuration,
    required this.price,
    this.packageCourseSyllabus,
    this.isRecommended,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  factory SchoolPackage.fromJson(Map<String, dynamic> json) => SchoolPackage(
        id: json['id'] as int,
        title: json['title'] as String,
        description: json['description'] as String,
        details: json['details'] as String,
        timeDuration: json['timeDuration'] as int,
        price: json['price'] as int,
        isRecommended: json['isRecommended'] as bool,
        packageCourseSyllabus: json['packageCourseSyllabus'] == null
            ? []
            : List<PackageCourseSyllabus>.from(
                json['packageCourseSyllabus']!
                    .map(PackageCourseSyllabus.fromJson) as Iterable,
              ),
        isActive: json['isActive'] as bool,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
      );

  int id;
  String title;
  String description;
  String details;
  int timeDuration;
  int price;
  bool? isRecommended;
  List<PackageCourseSyllabus>? packageCourseSyllabus;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'details': details,
        'timeDuration': timeDuration,
        'price': price,
        'isRecommended': isRecommended,
        'packageCourseSyllabus':
            List<dynamic>.from(packageCourseSyllabus!.map((x) => x.toJson())),
        'isActive': isActive,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
      };
}

class PackageCourseSyllabus {
  PackageCourseSyllabus({
    required this.id,
    required this.courseId,
  });

  factory PackageCourseSyllabus.fromJson(Map<String, dynamic> json) =>
      PackageCourseSyllabus(
        id: json['id'] as int,
        courseId: json['courseId'] as int,
      );

  int id;
  int courseId;

  Map<String, dynamic> toJson() => {
        'id': id,
        'courseId': courseId,
      };
}

class Review {
  Review({
    required this.id,
    required this.studentId,
    required this.schoolId,
    required this.date,
    required this.stars,
    required this.comment,
    required this.approved,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        id: json['id'] as int,
        studentId: json['studentId'] as int,
        schoolId: json['schoolId'] as int,
        date: DateTime.parse(json['date'] as String),
        stars: json['stars'] as int,
        comment: json['comment'] as String,
        approved: json['approved'] as bool,
      );

  int id;
  int studentId;
  int schoolId;
  DateTime date;
  int stars;
  String comment;
  bool approved;

  Map<String, dynamic> toJson() => {
        'id': id,
        'studentId': studentId,
        'schoolId': schoolId,
        'date': date.toIso8601String(),
        'stars': stars,
        'comment': comment,
        'approved': approved,
      };
}

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
            : List<int>.from(json['languages']!.map((dynamic x) => x) as Iterable),
        staff: List<Staff>.from(
                json['staff'].map(Staff.fromJson) as Iterable,
              ),
        scheduleFlow: json['scheduleFlow'] as int?,
        schoolStatus: json['schoolStatus'] as int?,
        primaryContact: json['primaryContact'] as int?,
        instructorSelection: json['instructorSelection'] as int?,
        logo: json['logo'] as String?,
        vehicles: json['vehicles'] == null
            ? []
            : List<Vehicle>.from(
                json['vehicles']!.map(Vehicle.fromJson) as Iterable,
              ),
        schoolLocations: json['schoolLocations'] == null
            ? []
            : List<SchoolLocation>.from(
                json['schoolLocations']!.map(SchoolLocation.fromJson)
                    as Iterable,
              ),
        documents: json['documents'] == null
            ? []
            : List<Document>.from(
                json['documents']!.map(Document.fromJson) as Iterable,
              ),
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
            : List<SchoolLocation>.from(
                schoolLocations!.map((x) => x.toJson()),
              ),
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
    required this.postalCode,
    required this.locationType,
    required this.landmark,
    required this.isActive,
  });

  factory SchoolLocation.fromJson(Map<String, dynamic> json) => SchoolLocation(
        id: json['id'] as int,
        name: json['name'] as String,
        address: json['address'] as String,
        city: json['city'] as String,
        postalCode: json['postalCode'] as String,
        locationType: json['locationType'] as int,
        landmark: json['landmark'] as String,
        isActive: json['isActive'] as bool,
      );

  int id;
  String name;
  String address;
  String city;
  String postalCode;
  int locationType;
  String landmark;
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
    required this.userStatus,
    required this.userType,
    this.avatar,
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
  String? avatar;
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
        documents: List<Document>.from(
          json['documents']!.map(Document.fromJson) as Iterable,
        ),
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
    required this.description,
    required this.transmission,
    required this.year,
    required this.images,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
        id: json['id'] as int,
        name: json['name'] as String,
        description: json['description'] as String,
        transmission: json['transmission'] as String,
        year: json['year'] as String,
        images: List<VehicleImage>.from(
          json['images']!.map(VehicleImage.fromJson) as Iterable,
        ),
      );

  int id;
  String name;
  String description;
  String transmission;
  String year;
  List<VehicleImage> images;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'transmission': transmission,
        'year': year,
        'images': List<dynamic>.from(images.map((x) => x.toJson())),
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
