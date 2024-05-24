class UpcomingLesson {
  UpcomingLesson({
    required this.lesson,
    required this.staff,
    required this.location,
  });

  factory UpcomingLesson.fromJson(Map<String, dynamic> json) => UpcomingLesson(
        lesson: Lesson.fromJson(json['lesson'] as Map<String, dynamic>),
        staff: Staff.fromJson(json['staff'] as Map<String, dynamic>),
        location: Location.fromJson(json['location'] as Map<String, dynamic>),
      );

  Lesson lesson;
  Staff staff;
  Location location;

  Map<String, dynamic> toJson() => {
        'lesson': lesson.toJson(),
        'staff': staff.toJson(),
        'location': location.toJson(),
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
        scheduledDate: json['scheduledDate'] as dynamic,
        scheduledTime:
            json['scheduledTime'] as dynamic,
        startTime: json['startTime'] as dynamic,
        endTime: json['endTime'] as dynamic,
        distance: json['distance'] as dynamic,
        duration: json['duration'] as dynamic,
        enabledBooking: json['enabledBooking'] as bool,
        progress: json['progress'] as int,
        progressStatus: json['progressStatus'] as String,
        instructorNote: json['instructorNote'] as dynamic,
      );

  int id;
  int courseId;
  int schoolPackageId;
  int studentId;
  dynamic scheduledDate;
  dynamic scheduledTime;
  dynamic startTime;
  dynamic endTime;
  dynamic distance;
  dynamic duration;
  bool enabledBooking;
  int progress;
  String progressStatus;
  dynamic instructorNote;

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
        'enabledBooking': enabledBooking,
        'progress': progress,
        'progressStatus': progressStatus,
        'instructorNote': instructorNote,
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
