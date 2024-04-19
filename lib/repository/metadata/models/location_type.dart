

class LocationType {

    LocationType({
       required this.value,
       required this.name,
    });

    factory LocationType.fromJson(Map<String, dynamic> json) => LocationType(
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
