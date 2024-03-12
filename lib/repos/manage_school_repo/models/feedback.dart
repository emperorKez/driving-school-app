import 'dart:convert';

class Review {
  Review({
    required this.id,
    required this.school,
    required this.student,
    required this.date,
    required this.stars,
    required this.comment,
    required this.feedbackApproval,
  });

  factory Review.fromRawJson(String str) =>
      Review.fromJson(json.decode(str) as Map<String, dynamic>);

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        id: json['id'] as int,
        school: json['school'] as int?,
        student: json['student'] as int?,
        date: DateTime.parse(json['date'] as String),
        stars: json['stars'] as double?,
        comment: json['comment'] as String?,
        feedbackApproval: json['feedbackApproval'] as bool,
      );

  int id;
  int? school;
  int? student;
  DateTime? date;
  double? stars;
  String? comment;
  bool? feedbackApproval;

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        'id': id,
        'school': school,
        'student': student,
        'date':
            "${date?.year.toString().padLeft(4, '0')}-${date?.month.toString().padLeft(2, '0')}-${date?.day.toString().padLeft(2, '0')}",
        'stars': stars,
        'comment': comment,
        'feedbackApproval': feedbackApproval, 
      };
}
