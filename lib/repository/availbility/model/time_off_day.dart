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
        startTime: json['startTime'] as String,
        endTime: json['endTime'] as String,
        schoolId: json['schoolId'] as int,
      );

  int id;
  DateTime date;
  String name;
  String startTime;
  String endTime;
  int schoolId;

  Map<String, dynamic> toJson() => {
        'id': id,
        'date': date.toIso8601String(),
        'name': name,
        'startTime': startTime,
        'endTime': endTime,
        'schoolId': schoolId,
      };
}


