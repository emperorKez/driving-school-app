class DocumentType {
  DocumentType({
    required this.value,
    required this.name,
  });

  factory DocumentType.fromJson(Map<String, dynamic> json) => DocumentType(
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
