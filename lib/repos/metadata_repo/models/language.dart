

class Language {

    Language({
       required this.id,
       required this.name,
    });

    factory Language.fromJson(Map<String, dynamic> json) => Language(
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
