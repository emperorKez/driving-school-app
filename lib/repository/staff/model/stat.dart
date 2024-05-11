class StaffStat {
  StaffStat({
    required this.totalWorkingHrs,
    required this.totalCompletedLessons,
    required this.scheduledLessons,
    required this.assignedLessons,
    required this.totalDistanceKms,
    required this.staff,
  });

  factory StaffStat.fromJson(Map<String, dynamic> json) => StaffStat(
        totalWorkingHrs: json['totalWorkingHrs'] as dynamic,
        totalCompletedLessons: json['totalCompletedLessons'] as dynamic,
        scheduledLessons: json['scheduledLessons'] as dynamic,
        assignedLessons: json['assignedLessons'] as dynamic,
        totalDistanceKms: json['totalDistanceKms'] as dynamic,
        staff: StaffProfile.fromJson(json['staff'] as Map<String, dynamic>),
      );
  dynamic totalWorkingHrs;
  dynamic totalCompletedLessons;
  dynamic scheduledLessons;
  dynamic assignedLessons;
  dynamic totalDistanceKms;
  StaffProfile staff;

  Map<String, dynamic> toJson() => {
        'totalWorkingHrs': totalWorkingHrs,
        'totalCompletedLessons': totalCompletedLessons,
        'scheduledLessons': scheduledLessons,
        'assignedLessons': assignedLessons,
        'totalDistanceKms': totalDistanceKms,
        'staff': staff.toJson(),
      };
}

class StaffProfile {
  StaffProfile({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
    required this.avatar,
    required this.userStatus,
    required this.userType,
  });

  factory StaffProfile.fromJson(Map<String, dynamic> json) => StaffProfile(
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
