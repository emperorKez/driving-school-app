// ignore_for_file: avoid_dynamic_calls

class StaffStudent {
  StaffStudent({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.packageIds,
    required this.totalLessons,
  });

  factory StaffStudent.fromJson(Map<String, dynamic> json) => StaffStudent(
        id: json['id'] as int,
        firstName: json['firstName'] as String,
        lastName: json['lastName'] as String,
        packageIds:
            List<int>.from(json['packageIds'].map((dynamic x) => x) as Iterable),
        totalLessons: json['totalLessons'] as int,
      );

  int id;
  String firstName;
  String lastName;
  List<int> packageIds;
  int totalLessons;

  Map<String, dynamic> toJson() => {
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'packageIds': List<dynamic>.from(packageIds.map((x) => x)),
        'totalLessons': totalLessons,
      };
}
