

class ScheduleFlow {

    ScheduleFlow({
       required this.id,
       required this.name,
    });

    factory ScheduleFlow.fromJson(Map<String, dynamic> json) => ScheduleFlow(
        id: json['id'] as int,
        name: json['name'] as String,
    );
    int id;
    String name;

    Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
    };
}
