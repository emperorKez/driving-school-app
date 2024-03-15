

class LocationType {

    LocationType({
       required this.id,
       required this.name,
    });

    factory LocationType.fromJson(Map<String, dynamic> json) => LocationType(
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
