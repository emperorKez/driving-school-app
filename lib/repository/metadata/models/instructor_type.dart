

class InstructorType {

    InstructorType({
       required this.id,
       required this.name,
    });

    factory InstructorType.fromJson(Map<String, dynamic> json) => InstructorType(
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
