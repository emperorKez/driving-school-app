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

  factory Coordinate.fromJson(dynamic json) => Coordinate(
        id: json['id'] as int,
        lessonId: json['lessonId'] as int,
        longitude: json['longitude'] as double,
        latitude: json['latitude'] as double,
        timestamp: json['timestamp'] as String,
      );

  int id;
  int lessonId;
  double longitude;
  double latitude;
  String timestamp;

  Map<String, dynamic> toJson() => {
        'id': id,
        'lessonId': lessonId,
        'longitude': longitude,
        'latitude': latitude,
        'timestamp': timestamp,
      };
}

class Feedback {
  Feedback({
    required this.id,
    required this.lessonId,
    required this.longitude,
    required this.latitude,
    required this.grade,
    required this.comment,
    required this.timestamp,
  });

  factory Feedback.fromJson(dynamic json) => Feedback(
        id: json['id'] as int,
        lessonId: json['lessonId'] as int,
        longitude: json['longitude'] as double,
        latitude: json['latitude'] as double,
        grade: json['grade'] as int,
        comment: json['comment'] as String,
        timestamp: DateTime.parse(json['timestamp'] as String),
      );

  int id;
  int lessonId;
  double longitude;
  double latitude;
  int grade;
  String comment;
  DateTime timestamp;

  Map<String, dynamic> toJson() => {
        'id': id,
        'lessonId': lessonId,
        'longitude': longitude,
        'latitude': latitude,
        'grade': grade,
        'comment': comment,
        'timestamp': timestamp.toIso8601String(),
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
    required this.enabledBooking,
    required this.progress,
    required this.progressStatus, 
    required this.instructorNote,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) => Lesson(
        id: json['id'] as int,
        courseId: json['courseId'] as int,
        schoolPackageId: json['schoolPackageId'] as int,
        studentId: json['studentId'] as int,
        scheduledDate: json['scheduledDate'] as String,
        scheduledTime: json['scheduledTime'] as String,
        startTime: json['startTime'] as String,
        endTime: json['endTime'] as dynamic,
        distance: json['distance'] as dynamic,
        duration: json['duration'] as double,
        enabledBooking: json['enabledBooking'] as bool,
        progress: json['progress'] as int,
        progressStatus: json['progressStatus'] as dynamic,
        instructorNote: json['instructorNote'] as dynamic,
      );

  int id;
  int courseId;
  int schoolPackageId;
  int studentId;
  String scheduledDate;
  String scheduledTime;
  String startTime;
  dynamic endTime;
  dynamic distance;
  double duration;
  bool enabledBooking;
  int progress;
  dynamic progressStatus;
  dynamic instructorNote;

  Map<String, dynamic> toJson() => {
        'id': id,
        'courseId': courseId,
        'schoolPackageId': schoolPackageId,
        'studentId': studentId,
        'scheduledDate': scheduledDate,
        'scheduledTime': scheduledTime,
        'startTime': startTime,
        'endTime': endTime,
        'distance': distance,
        'duration': duration,
        'enabledBooking': enabledBooking,
        'progress': progress,
        'progressStatus': progressStatus,
        'instructorNote': instructorNote
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
      );

  int id;
  String firstName;
  String lastName;
  String phoneNumber;
  String email;
  String avatar;
  int userStatus;
  int userType;

  Map<String, dynamic> toJson() => {
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'phoneNumber': phoneNumber,
        'email': email,
        'avatar': avatar,
        'userStatus': userStatus,
        'userType': userType,
      };
}
