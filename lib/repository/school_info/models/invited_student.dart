class InvitedStudent {
  InvitedStudent({
    required this.id,
    required this.email,
    required this.schoolId,
  });

  factory InvitedStudent.fromJson(Map<String, dynamic> json) => InvitedStudent(
        id: json['id'] as int,
        email: json['email'] as String,
        schoolId: json['schoolId'] as String,
      );

  int id;
  String email;
  String schoolId;

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'schoolId': schoolId,
      };
}
