// ignore_for_file: avoid_dynamic_calls

class AvailableDate {
  AvailableDate({
    required this.id,
    required this.weekday,
    required this.availableHours,
  });

  factory AvailableDate.fromJson(Map<String, dynamic> json) => AvailableDate(
        id: json['id'] as int,
        weekday: json['weekday'] as int,
        availableHours: List<AvailableHour>.from(
            json['availableHours'].map(AvailableHour.fromJson) as Iterable,),
      );

  int id;
  int weekday;
  List<AvailableHour> availableHours;

  Map<String, dynamic> toJson() => {
        'id': id,
        'weekday': weekday,
        'availableHours':
            List<dynamic>.from(availableHours.map((x) => x.toJson())),
      };
}

class AvailableHour {
  AvailableHour({
    required this.id,
    required this.startTime,
    required this.endTime,
  });

  factory AvailableHour.fromJson(Map<String, dynamic> json) => AvailableHour(
        id: json['id'] as int,
        startTime: Time.fromJson(json['startTime'] as Map<String, dynamic>),
        endTime: Time.fromJson(json['endTime'] as Map<String, dynamic>),
      );

  int id;
  Time startTime;
  Time endTime;

  Map<String, dynamic> toJson() => {
        'id': id,
        'startTime': startTime.toJson(),
        'endTime': endTime.toJson(),
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
