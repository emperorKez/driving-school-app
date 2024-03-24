class PackagePayment {
  PackagePayment({
    required this.id,
    required this.studentId,
    required this.packageId,
    required this.paymentId,
    required this.status,
    required this.stats,
    required this.comment,
  });

  factory PackagePayment.fromJson(Map<String, dynamic> json) => PackagePayment(
        id: json['id'] as int,
        studentId: json['studentId'] as int,
        packageId: json['packageId'] as int,
        paymentId: json['paymentId'] as int,
        status: json['status'] as int,
        stats: Stats.fromJson(json['stats'] as Map<String, dynamic>),
        comment: json['comment'] as String,
      );

  int id;
  int studentId;
  int packageId;
  int paymentId;
  int status;
  Stats stats;
  String comment;

  Map<String, dynamic> toJson() => {
        'id': id,
        'studentId': studentId,
        'packageId': packageId,
        'paymentId': paymentId,
        'status': status,
        'stats': stats.toJson(),
        'comment': comment,
      };
}

class Stats {
  Stats({
    required this.lessonsScheduled,
    required this.pendingLessons,
    required this.hrsRemaining,
    required this.completedLessons,
    required this.completedHrs,
  });

  factory Stats.fromJson(Map<String, dynamic> json) => Stats(
        lessonsScheduled: json['lessonsScheduled'] as int,
        pendingLessons: json['pendingLessons'] as int,
        hrsRemaining: json['hrsRemaining'] as int,
        completedLessons: json['completedLessons'] as int,
        completedHrs: json['completedHrs'] as int,
      );

  int lessonsScheduled;
  int pendingLessons;
  int hrsRemaining;
  int completedLessons;
  int completedHrs;

  Map<String, dynamic> toJson() => {
        'lessonsScheduled': lessonsScheduled,
        'pendingLessons': pendingLessons,
        'hrsRemaining': hrsRemaining,
        'completedLessons': completedLessons,
        'completedHrs': completedHrs,
      };
}
