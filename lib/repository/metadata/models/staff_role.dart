class StaffRole {
  StaffRole({
    required this.value,
    required this.name,
  });

  factory StaffRole.fromJson(Map<String, dynamic> json) => StaffRole(
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
