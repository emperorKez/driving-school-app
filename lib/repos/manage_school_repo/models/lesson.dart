class Lesson {
  Lesson({
    required this.id,
    required this.title,
    required this.description,
    required this.languageId,
    required this.price,
    required this.schoolId,
    required this.groupLessons,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) => Lesson(
        id: json['id'] as int,
        title: json['title'] as String,
        description: json['description'] as String,
        languageId: json['languageId'] as int,
        price: json['price'] as int,
        schoolId: json['schoolId'] as int,
        groupLessons: List<GroupLesson>.from(
            json['groupLessons'].map(GroupLesson.fromJson) as Iterable,),
      );

  int id;
  String title;
  String description;
  int languageId;
  int price;
  int schoolId;
  List<GroupLesson> groupLessons;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'languageId': languageId,
        'price': price,
        'schoolId': schoolId,
        'groupLessons': List<dynamic>.from(groupLessons.map((x) => x.toJson())),
      };
}

class GroupLesson {
  GroupLesson({
    required this.id,
    required this.locationId,
    required this.staffId,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.seats,
    required this.lessonStatus,
    required this.groupLessonStudentRefs,
  });

  factory GroupLesson.fromJson(Map<String, dynamic> json) => GroupLesson(
        id: json['id'] as int,
        locationId: json['locationId'] as int,
        staffId: json['staffId'] as int,
        date: DateTime.parse(json['date'] as String),
        startTime: Time.fromJson(json['startTime'] as Map<String, dynamic>),
        endTime: Time.fromJson(json['endTime'] as Map<String, dynamic>),
        seats: json['seats'] as int,
        lessonStatus: json['lessonStatus'] as int,
        groupLessonStudentRefs: List<int>.from(
            json['groupLessonStudentRefs'].map((int x) => x) as Iterable,),
      );

  int id;
  int locationId;
  int staffId;
  DateTime date;
  Time startTime;
  Time endTime;
  int seats;
  int lessonStatus;
  List<int> groupLessonStudentRefs;

  Map<String, dynamic> toJson() => {
        'id': id,
        'locationId': locationId,
        'staffId': staffId,
        'date': date.toIso8601String(),
        'startTime': startTime.toJson(),
        'endTime': endTime.toJson(),
        'seats': seats,
        'lessonStatus': lessonStatus,
        'groupLessonStudentRefs':
            List<dynamic>.from(groupLessonStudentRefs.map((x) => x)),
      };
}

class Time {
  Time({
    this.hour,
    this.minute,
    this.second,
    this.nano,
  });

  factory Time.fromJson(Map<String, dynamic> json) => Time(
        hour: json['hour'] as int,
        minute: json['minute'] as int,
        second: json['second'] as int,
        nano: json['nano'] as int,
      );

  int? hour;
  int? minute;
  int? second;
  int? nano;

  Map<String, dynamic> toJson() => {
        'hour': hour,
        'minute': minute,
        'second': second,
        'nano': nano,
      };
}
