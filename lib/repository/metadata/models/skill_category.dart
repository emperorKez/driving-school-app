// ignore_for_file: avoid_dynamic_calls

class SkillCategory {
  SkillCategory({
    required this.id,
    required this.name,
    required this.code,
    required this.icon,
    required this.description,
    required this.subCategories,
  });

  factory SkillCategory.fromJson(Map<String, dynamic> json) => SkillCategory(
        id: json['id'] as int,
        name: json['name'] as String,
        code: json['code'] as String,
        icon: json['icon'] as String,
        description: json['description'] as String,
        subCategories: List<SubCategory>.from(
            json['subCategories'].map(SubCategory.fromJson) as Iterable,),
      );

  int id;
  String name;
  String code;
  String icon;
  String description;
  List<SubCategory> subCategories;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'code': code,
        'icon': icon,
        'description': description,
        'subCategories':
            List<dynamic>.from(subCategories.map((x) => x.toJson())),
      };
}

class SubCategory {
  SubCategory({
    required this.id,
    required this.name,
    required this.code,
    required this.description,
  });

  factory SubCategory.fromJson(dynamic json) => SubCategory(
        id: json['id'] as int,
        name: json['name'] as String,
        code: json['code'] as String,
        description: json['description'] as String,
      );

  int id;
  String name;
  String code;
  String description;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'code': code,
        'description': description,
      };
}
