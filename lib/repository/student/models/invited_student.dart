class InvitedStudents {
  InvitedStudents(
      {required this.id,
      required this.schoolId,
      required this.email,
      this.comment,});

  factory InvitedStudents.fromJson(Map<String, dynamic> json) =>
      InvitedStudents(
        id: json['id'] as int,
        schoolId: json['schoolId'] as int,
        email: json['email'] as String,
        comment: json['comment'] as String?,
      );

  int id;
  int schoolId;
  String email;
  String? comment;

  Map<String, dynamic> toJson() => {
        'id': id,
        'schoolId': schoolId,
        'email': email,
        'comment': comment,
      };
}
