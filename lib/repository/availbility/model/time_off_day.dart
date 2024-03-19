class TimeOffDay {
  TimeOffDay({
    required this.id,
    required this.date,
    required this.name,
    required this.startTime,
    required this.endTime,
    required this.schoolId,
  });

  factory TimeOffDay.fromJson(Map<String, dynamic> json) => TimeOffDay(
        id: json['id'] as int,
        date: DateTime.parse(json['date'] as String),
        name: json['name'] as String,
        startTime: Time.fromJson(json['startTime'] as Map<String, dynamic>),
        endTime: Time.fromJson(json['endTime'] as Map<String, dynamic>),
        schoolId: json['schoolId'] as int,
      );

  int id;
  DateTime date;
  String name;
  Time startTime;
  Time endTime;
  int schoolId;

  Map<String, dynamic> toJson() => {
        'id': id,
        'date': date.toIso8601String(),
        'name': name,
        'startTime': startTime.toJson(),
        'endTime': endTime.toJson(),
        'schoolId': schoolId,
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
        hour: json['hour'] as int?,
        minute: json['minute'] as int?,
        second: json['second'] as int?,
        nano: json['nano'] as int?,
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
