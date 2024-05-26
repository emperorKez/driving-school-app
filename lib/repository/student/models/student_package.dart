// ignore_for_file: avoid_dynamic_calls

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
            json['upcomingLessons'].map(Lesson.fromJson) as Iterable,),
        pastLessons: List<Lesson>.from(
            json['pastLessons'].map(Lesson.fromJson) as Iterable,),
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
    required this.enabledBooking,
    required this.progress,
    required this.progressStatus,
    required this.instructorNote,
  });

  factory Lesson.fromJson( dynamic json) => Lesson(
        id: json['id'] as int,
        courseId: json['courseId'] as int,
        schoolPackageId: json['schoolPackageId'] as int,
        studentId: json['studentId'] as int,
        scheduledDate: json['scheduledDate'] as dynamic,
        scheduledTime: json['scheduledTime'] as dynamic,
        startTime: json['startTime'] as dynamic,
        endTime: json['endTime'] as dynamic,
        distance: json['distance'] as dynamic,
        duration: json['duration'] as double,
        enabledBooking: json['enabledBooking'] as bool,
        progress: json['progress'] as int,
        progressStatus: json['progressStatus'] as String,
        instructorNote: json['instructorNote'] as dynamic,
      );

  int id;
  int courseId;
  int schoolPackageId;
  int studentId;
  dynamic scheduledDate;
  dynamic scheduledTime;
  dynamic startTime;
  dynamic endTime;
  dynamic distance;
  double duration;
  bool enabledBooking;
  int progress;
  String progressStatus;
  dynamic instructorNote;

  Map<String, dynamic> toJson() => {
        'id': id,
        'courseId': courseId,
        'schoolPackageId': schoolPackageId,
        'studentId': studentId,
        'scheduledDate': scheduledDate,
        'scheduledTime': scheduledTime,
        'startTime': startTime,
        'endTime': endTime,
        'distance': distance,
        'duration': duration,
        'enabledForBooking': enabledBooking,
        'progress': progress,
        'progressStatus': progressStatus,
        'instructorNote': instructorNote,
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
        hrsRemaining: json['hrsRemaining'] as double,
        hrsCompleted: json['hrsCompleted'] as double,
        hrsScheduled: json['hrsScheduled'] as double,
        hrsPending: json['hrsPending'] as double,
        completedLessons: json['completedLessons'] as int,
      );

  int lessonsScheduled;
  int pendingLessons;
  double hrsRemaining;
  double hrsCompleted;
  double hrsScheduled;
  double hrsPending;
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
