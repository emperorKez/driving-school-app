// ignore_for_file: avoid_dynamic_calls

import 'package:korbil_mobile/repository/student/models/student.dart';
import 'package:korbil_mobile/repository/student/models/student_package.dart';

class CustomStudent {
  CustomStudent({
    required this.student,
    this.studentPackage,
  });

  factory CustomStudent.fromJson(Map<String, dynamic> json) => CustomStudent(
        student: Student.fromJson(json['student'] as Map<String, dynamic>),
        studentPackage: StudentPackage.fromJson(
            json['studentPackage'] as Map<String, dynamic>,),
      );

  Student student;
  StudentPackage? studentPackage;

  Map<String, dynamic> toJson() => {
        'student': student.toJson(),
        'studentPackage': studentPackage!.toJson(),
      };
}
