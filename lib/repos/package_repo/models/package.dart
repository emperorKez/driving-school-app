import 'dart:convert';

class Package {
  Package({
    required this.id,
    required this.title,
    required this.details,
    required this.timeDuration,
    required this.price,
    required this.discount,
    required this.syllabuses,
    required this.recommended,
  });

  int? id;
  String? title;
  String? details;
  String? timeDuration;
  double? price;
  double? discount;
  List<int>? syllabuses;
  bool? recommended;

  factory Package.fromRawJson(String str) =>
      Package.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  factory Package.fromJson(Map<String, dynamic> json) => Package(
        id: json["id"] as int?,
        title: json["title"] as String?,
        details: json["details"] as String?,
        timeDuration: json["timeDuration"] as String?,
        price: json["price"] as double?,
        discount: json["discount"] as double?,
        syllabuses: ((json["syllabuses"]) as List).cast<int>(),
        recommended: json["recommended"] as bool?,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "details": details,
        "timeDuration": timeDuration,
        "price": price,
        "discount": discount,
        "syllabuses": List<dynamic>.from(syllabuses!.map((x) => x)),
        "recommended": recommended,
      };
}
