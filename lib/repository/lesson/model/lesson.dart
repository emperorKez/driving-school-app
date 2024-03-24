// ignore_for_file: avoid_dynamic_calls
  
class LessonDetail {
  LessonDetail({
    required this.lesson,
    required this.staff,
    required this.location,
    required this.coordinates,
    required this.feedback,
  });

  factory LessonDetail.fromJson(Map<String, dynamic> json) => LessonDetail(
        lesson: Lesson.fromJson(json['lesson'] as Map<String, dynamic>),
        staff: Staff.fromJson(json['staff'] as Map<String, dynamic>),
        location: Location.fromJson(json['location'] as Map<String, dynamic>),
        coordinates: List<Coordinate>.from(
            json['coordinates'].map(Coordinate.fromJson) as Iterable,),
        feedback: List<Feedback>.from(
            json['feedback'].map(Feedback.fromJson) as Iterable,),
      );

  Lesson lesson;
  Staff staff;
  Location location;
  List<Coordinate> coordinates;
  List<Feedback> feedback;

  Map<String, dynamic> toJson() => {
        'lesson': lesson.toJson(),
        'staff': staff.toJson(),
        'location': location.toJson(),
        'coordinates': List<dynamic>.from(coordinates.map((x) => x.toJson())),
        'feedback': List<dynamic>.from(feedback.map((x) => x.toJson())),
      };
}

class Coordinate {
  Coordinate({
    required this.id,
    required this.lessonId,
    required this.longitude,
    required this.latitude,
    required this.timestamp,
  });

  factory Coordinate.fromJson(Map<String, dynamic> json) => Coordinate(
        id: json['id'] as int,
        lessonId: json['lessonId'] as int,
        longitude: json['longitude'] as String,
        latitude: json['latitude'] as String,
        timestamp: DateTime.parse(json['timestamp'] as String),
      );

  int id;
  int lessonId;
  String longitude;
  String latitude;
  DateTime timestamp;

  Map<String, dynamic> toJson() => {
        'id': id,
        'lessonId': lessonId,
        'longitude': longitude,
        'latitude': latitude,
        'timestamp': timestamp.toIso8601String(),
      };
}

class Feedback {
  Feedback({
    required this.id,
    required this.category,
    required this.subCategory,
    required this.lessonId,
    required this.longitude,
    required this.latitude,
    required this.grade,
    required this.comment,
    required this.timestamp,
  });

  factory Feedback.fromJson(Map<String, dynamic> json) => Feedback(
        id: json['id'] as int,
        category: Category.fromJson(json['category'] as Map<String, dynamic>),
        subCategory:
            SubCategory.fromJson(json['subCategory'] as Map<String, dynamic>),
        lessonId: json['lessonId'] as int,
        longitude: json['longitude'] as String,
        latitude: json['latitude'] as String,
        grade: json['grade'] as int,
        comment: json['comment'] as String,
        timestamp: DateTime.parse(json['timestamp'] as String),
      );

  int id;
  Category category;
  SubCategory subCategory;
  int lessonId;
  String longitude;
  String latitude;
  int grade;
  String comment;
  DateTime timestamp;

  Map<String, dynamic> toJson() => {
        'id': id,
        'category': category.toJson(),
        'subCategory': subCategory.toJson(),
        'lessonId': lessonId,
        'longitude': longitude,
        'latitude': latitude,
        'grade': grade,
        'comment': comment,
        'timestamp': timestamp.toIso8601String(),
      };
}

class Category {
  Category({
    required this.id,
    required this.name,
    required this.code,
    required this.icon,
    required this.description,
    required this.subCategories,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json['id'] as int,
        name: json['name'] as String,
        code: json['code'] as String,
        icon: json['icon'] as String,
        description: json['description'] as String,
        subCategories: List<SubCategory>.from(
            json['subCategories'].map(SubCategory.fromJson) as Iterable,),
      );

  int id;
  String name;
  String code;
  String icon;
  String description;
  List<SubCategory> subCategories;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'code': code,
        'icon': icon,
        'description': description,
        'subCategories':
            List<dynamic>.from(subCategories.map((x) => x.toJson())),
      };
}

class SubCategory {
  SubCategory({
    required this.id,
    required this.name,
    required this.code,
    required this.description,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
        id: json['id'] as int,
        name: json['name'] as String,
        code: json['code'] as String,
        description: json['description'] as String,
      );

  int id;
  String name;
  String code;
  String description;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'code': code,
        'description': description,
      };
}

class Lesson {
  Lesson({
    required this.id,
    required this.courseId,
    required this.schoolPackageId,
    required this.studentId,
    required this.scheduledDate,
    required this.scheduledTime,
    required this.startTime,
    required this.endTime,
    required this.distance,
    required this.duration,
    required this.enabledForBooking,
    required this.progress,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) => Lesson(
        id: json['id'] as int,
        courseId: json['courseId'] as int,
        schoolPackageId: json['schoolPackageId'] as int,
        studentId: json['studentId'] as int,
        scheduledDate: DateTime.parse(json['scheduledDate'] as String),
        scheduledTime:
            Time.fromJson(json['scheduledTime'] as Map<String, dynamic>),
        startTime: Time.fromJson(json['startTime'] as Map<String, dynamic>),
        endTime: Time.fromJson(json['endTime'] as Map<String, dynamic>),
        distance: json['distance'] as int,
        duration: json['duration'] as int,
        enabledForBooking: json['enabledForBooking'] as bool,
        progress: json['progress'] as int,
      );

  int id;
  int courseId;
  int schoolPackageId;
  int studentId;
  DateTime scheduledDate;
  Time scheduledTime;
  Time startTime;
  Time endTime;
  int distance;
  int duration;
  bool enabledForBooking;
  int progress;

  Map<String, dynamic> toJson() => {
        'id': id,
        'courseId': courseId,
        'schoolPackageId': schoolPackageId,
        'studentId': studentId,
        'scheduledDate': scheduledDate.toIso8601String(),
        'scheduledTime': scheduledTime.toJson(),
        'startTime': startTime.toJson(),
        'endTime': endTime.toJson(),
        'distance': distance,
        'duration': duration,
        'enabledForBooking': enabledForBooking,
        'progress': progress,
      };
}

class Time {
  Time({
    required this.hour,
    required this.minute,
    required this.second,
    required this.nano,
  });

  factory Time.fromJson(Map<String, dynamic> json) => Time(
        hour: json['hour'] as int,
        minute: json['minute'] as int,
        second: json['second'] as int,
        nano: json['nano'] as int,
      );

  int hour;
  int minute;
  int second;
  int nano;

  Map<String, dynamic> toJson() => {
        'hour': hour,
        'minute': minute,
        'second': second,
        'nano': nano,
      };
}

class Location {
  Location({
    required this.id,
    required this.name,
    required this.address,
    required this.city,
    required this.postalCode,
    required this.locationType,
    required this.landmark,
    required this.schoolId,
    required this.isSelected,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        id: json['id'] as int,
        name: json['name'] as String,
        address: json['address'] as String,
        city: json['city'] as String,
        postalCode: json['postalCode'] as String,
        locationType: json['locationType'] as int,
        landmark: json['landmark'] as String,
        schoolId: json['schoolId'] as int,
        isSelected: json['isSelected'] as bool,
      );

  int id;
  String name;
  String address;
  String city;
  String postalCode;
  int locationType;
  String landmark;
  int schoolId;
  bool isSelected;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'address': address,
        'city': city,
        'postalCode': postalCode,
        'locationType': locationType,
        'landmark': landmark,
        'schoolId': schoolId,
        'isSelected': isSelected,
      };
}

class Staff {
  Staff({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
    required this.avatar,
    required this.userStatus,
    required this.userType,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Staff.fromJson(Map<String, dynamic> json) => Staff(
        id: json['id'] as int,
        firstName: json['firstName'] as String,
        lastName: json['lastName'] as String,
        phoneNumber: json['phoneNumber'] as String,
        email: json['email'] as String,
        avatar: json['avatar'] as String,
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
  String avatar;
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
