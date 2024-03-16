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
