class PaymentHistory {
  PaymentHistory({
    required this.student,
    required this.payment,
  });

  factory PaymentHistory.fromJson(Map<String, dynamic> json) => PaymentHistory(
        student: Student.fromJson(json['student'] as Map<String, dynamic>),
        payment: Payment.fromJson(json['payment'] as Map<String, dynamic>),
      );

  Student student;
  Payment payment;

  Map<String, dynamic> toJson() => {
        'student': student.toJson(),
        'payment': payment.toJson(),
      };
}

class Payment {
  Payment({
    required this.amount,
    required this.status,
    required this.date,
  });

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        amount: json['amount'] as int,
        status: json['status'] as String,
        date: DateTime.parse(json['date'] as String),
      );

  int amount;
  String status;
  DateTime date;

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'status': status,
        'date': date.toIso8601String(),
      };
}

class Student {
  Student({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
    required this.userStatus,
    required this.userType,
    required this.createdAt,
    required this.updatedAt,
    this.avatar,
  });

  factory Student.fromJson(Map<String, dynamic> json) => Student(
        id: json['id'] as int,
        firstName: json['firstName'] as String,
        lastName: json['lastName'] as String,
        phoneNumber: json['phoneNumber'] as String,
        email: json['email'] as String,
        avatar: json['avatar'] as String?,
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
  String? avatar;
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
