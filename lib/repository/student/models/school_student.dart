// ignore_for_file: avoid_dynamic_calls

class SchoolStudent {
  SchoolStudent({
    required this.currentStudents,
    required this.pendingApproval,
  });

  factory SchoolStudent.fromJson(Map<String, dynamic> json) => SchoolStudent(
        currentStudents: List<CurrentStudent>.from(json['currentStudents']
            .map(CurrentStudent.fromJson) as Iterable,),
        pendingApproval: List<PendingApproval>.from(json['pendingApproval']
            .map(PendingApproval.fromJson) as Iterable,),
      );

  List<CurrentStudent> currentStudents;
  List<PendingApproval> pendingApproval;

  Map<String, dynamic> toJson() => {
        'currentStudents':
            List<dynamic>.from(currentStudents.map((x) => x.toJson())),
        'pendingApproval':
            List<dynamic>.from(pendingApproval.map((x) => x.toJson())),
      };
}

class CurrentStudent {
  CurrentStudent({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.avatar,
    required this.packageIds,
    required this.totalLessons,
  });

  factory CurrentStudent.fromJson(dynamic json) => CurrentStudent(
        id: json['id'] as int,
        firstName: json['firstName'] as String,
        lastName: json['lastName'] as String,
        avatar: json['avatar'] as String,
        packageIds: List<int>.from(
            json['packageIds'].map((dynamic x) => x) as Iterable,),
        totalLessons: json['totalLessons'] as int,
      );

  int id;
  String firstName;
  String lastName;
  String avatar;
  List<int> packageIds;
  int totalLessons;

  Map<String, dynamic> toJson() => {
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'avatar': avatar,
        'packageIds': List<dynamic>.from(packageIds.map((x) => x)),
        'totalLessons': totalLessons,
      };
}

class PendingApproval {
  PendingApproval({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.avatar,
    required this.studentPackageId,
    required this.packageName,
  });

  factory PendingApproval.fromJson(dynamic json) =>
      PendingApproval(
        id: json['id'] as int,
        firstName: json['firstName'] as String,
        lastName: json['lastName'] as String,
        avatar: json['avatar'] as String,
        studentPackageId: json['studentPackageId'] as int,
        packageName: json['packageName'] as String,
      );

  int id;
  String firstName;
  String lastName;
  String avatar;
  int studentPackageId;
  String packageName;

  Map<String, dynamic> toJson() => {
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'avatar': avatar,
        'studentPackageId': studentPackageId,
        'packageName': packageName,
      };
}
