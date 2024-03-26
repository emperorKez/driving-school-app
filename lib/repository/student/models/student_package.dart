class StudentPackage {
  StudentPackage({
    required this.studentPackageId,
    required this.schoolPackageId,
    required this.stats,
    required this.upcomingLessons,
    required this.pastLessons,
  });

  factory StudentPackage.fromJson(Map<String, dynamic> json) => StudentPackage(
        studentPackageId: json['studentPackageId'] as int,
        schoolPackageId: json['schoolPackageId'] as int,
        stats: Stats.fromJson(json['stats'] as Map<String, dynamic>),
        upcomingLessons: List<Lesson>.from(
            json['upcomingLessons'].map(Lesson.fromJson) as Iterable),
        pastLessons: List<Lesson>.from(
            json['pastLessons'].map(Lesson.fromJson) as Iterable),
      );

  int studentPackageId;
  int schoolPackageId;
  Stats stats;
  List<Lesson> upcomingLessons;
  List<Lesson> pastLessons;

  Map<String, dynamic> toJson() => {
        'studentPackageId': studentPackageId,
        'schoolPackageId': schoolPackageId,
        'stats': stats.toJson(),
        'upcomingLessons':
            List<dynamic>.from(upcomingLessons.map((x) => x.toJson())),
        'pastLessons': List<dynamic>.from(pastLessons.map((x) => x.toJson())),
      };
}

class Lesson {
  Lesson({
    required this.id,
    required this.courseId,
    required this.schoolPackageId,
    required this.studentId,
    required this.scheduledDate,
    required this.scheduledTime,
    required this.startTime,
    required this.endTime,
    required this.distance,
    required this.duration,
    required this.enabledForBooking,
    required this.progress,
    required this.progressStatus,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) => Lesson(
        id: json['id'] as int,
        courseId: json['courseId'] as int,
        schoolPackageId: json['schoolPackageId'] as int,
        studentId: json['studentId'] as int,
        scheduledDate: DateTime.parse(json['scheduledDate'] as String),
        scheduledTime:
            Time.fromJson(json['scheduledTime'] as Map<String, dynamic>),
        startTime: Time.fromJson(json['startTime'] as Map<String, dynamic>),
        endTime: Time.fromJson(json['endTime'] as Map<String, dynamic>),
        distance: json['distance'] as int,
        duration: json['duration'] as int,
        enabledForBooking: json['enabledForBooking'] as bool,
        progress: json['progress'] as int,
        progressStatus: json['progressStatus'] as String,
      );

  int id;
  int courseId;
  int schoolPackageId;
  int studentId;
  DateTime scheduledDate;
  Time scheduledTime;
  Time startTime;
  Time endTime;
  int distance;
  int duration;
  bool enabledForBooking;
  int progress;
  String progressStatus;

  Map<String, dynamic> toJson() => {
        'id': id,
        'courseId': courseId,
        'schoolPackageId': schoolPackageId,
        'studentId': studentId,
        'scheduledDate': scheduledDate.toIso8601String(),
        'scheduledTime': scheduledTime.toJson(),
        'startTime': startTime.toJson(),
        'endTime': endTime.toJson(),
        'distance': distance,
        'duration': duration,
        'enabledForBooking': enabledForBooking,
        'progress': progress,
        'progressStatus': progressStatus,
      };
}

class Time {
  Time({
    required this.hour,
    required this.minute,
    required this.second,
    required this.nano,
  });

  factory Time.fromJson(Map<String, dynamic> json) => Time(
        hour: json['hour'] as int,
        minute: json['minute'] as int,
        second: json['second'] as int,
        nano: json['nano'] as int,
      );

  int hour;
  int minute;
  int second;
  int nano;

  Map<String, dynamic> toJson() => {
        'hour': hour,
        'minute': minute,
        'second': second,
        'nano': nano,
      };
}

class Stats {
  Stats({
    required this.lessonsScheduled,
    required this.pendingLessons,
    required this.hrsRemaining,
    required this.hrsCompleted,
    required this.hrsScheduled,
    required this.hrsPending,
    required this.completedLessons,
  });

  factory Stats.fromJson(Map<String, dynamic> json) => Stats(
        lessonsScheduled: json['lessonsScheduled'] as int,
        pendingLessons: json['pendingLessons'] as int,
        hrsRemaining: json['hrsRemaining'] as int,
        hrsCompleted: json['hrsCompleted'] as int,
        hrsScheduled: json['hrsScheduled'] as int,
        hrsPending: json['hrsPending'] as int,
        completedLessons: json['completedLessons'] as int,
      );

  int lessonsScheduled;
  int pendingLessons;
  int hrsRemaining;
  int hrsCompleted;
  int hrsScheduled;
  int hrsPending;
  int completedLessons;

  Map<String, dynamic> toJson() => {
        'lessonsScheduled': lessonsScheduled,
        'pendingLessons': pendingLessons,
        'hrsRemaining': hrsRemaining,
        'hrsCompleted': hrsCompleted,
        'hrsScheduled': hrsScheduled,
        'hrsPending': hrsPending,
        'completedLessons': completedLessons,
      };
}
