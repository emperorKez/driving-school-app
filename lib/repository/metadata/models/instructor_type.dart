

class InstructorType {

    InstructorType({
       required this.value,
       required this.name,
    });

    factory InstructorType.fromJson(Map<String, dynamic> json) => InstructorType(
        value: json['value'] as int,
        name: json['name'] as String,
    );
    int value;
    String name;

    Map<String, dynamic> toJson() => {
        'value': value,
        'name': name,
    };
}
