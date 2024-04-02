class Calender {
        Calender({
        required this.id,
        required this.staffId,
        required this.title,
        required this.scheduledDate,
        required this.scheduledTime,
        required this.duration,
        required this.student,
        required this.location,
        required this.groupLesson,
    });

    factory Calender.fromJson(Map<String, dynamic> json) => Calender(
        id: json['id'] as int,
        staffId: json['staffId'] as int,
        title: json['title'] as String,
        scheduledDate: DateTime.parse(json['scheduledDate'] as String),
        scheduledTime: ScheduledTime.fromJson(json['scheduledTime'] as Map<String, dynamic>),
        duration: json['duration'] as int,
        student: Student.fromJson(json['student'] as Map<String, dynamic>),
        location: Location.fromJson(json['location'] as Map<String, dynamic>),
        groupLesson: json['groupLesson'] as bool,
    );

    int id;
    int staffId;
    String title;
    DateTime scheduledDate;
    ScheduledTime scheduledTime;
    int duration;
    Student student;
    Location location;
    bool groupLesson;

    Map<String, dynamic> toJson() => {
        'id': id,
        'staffId': staffId,
        'title': title,
        'scheduledDate': scheduledDate.toIso8601String(),
        'scheduledTime': scheduledTime.toJson(),
        'duration': duration,
        'student': student.toJson(),
        'location': location.toJson(),
        'groupLesson': groupLesson,
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

class ScheduledTime {
        ScheduledTime({
        required this.hour,
        required this.minute,
        required this.second,
        required this.nano,
    });

    factory ScheduledTime.fromJson(Map<String, dynamic> json) => ScheduledTime(
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

class Student {
       Student({
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

    factory Student.fromJson(Map<String, dynamic> json) => Student(
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
