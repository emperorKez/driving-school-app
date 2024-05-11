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
        amount: json['amount'] as double,
        status: json['status'] as String,
        date: DateTime.parse(json['date'] as String),
      );

  double amount;
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
      );

  int id;
  String firstName;
  String lastName;
  String phoneNumber;
  String email;
  String? avatar;
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
