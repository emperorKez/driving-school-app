class SchoolLocation {
  SchoolLocation({
    required this.id,
    required this.name,
    required this.address,
    required this.city,
    required this.postalCode,
    required this.locationType,
    required this.landmark,
    required this.schoolId,
    required this.isActive,
  });

  factory SchoolLocation.fromJson(Map<String, dynamic> json) => SchoolLocation(
        id: json['id'] as int,
        name: json['name'] as String,
        address: json['address'] as String,
        city: json['city'] as String,
        postalCode: json['postalCode'] as String,
        locationType: json['locationType'] as int,
        landmark: json['landmark'] as String,
        schoolId: json['schoolId'] as int,
        isActive: json['isActive'] as bool,
      );

  int id;
  String name;
  String address;
  String city;
  String postalCode;
  int locationType;
  String landmark;
  int schoolId;
  bool isActive;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'address': address,
        'city': city,
        'postalCode': postalCode,
        'locationType': locationType,
        'landmark': landmark,
        'schoolId': schoolId,
        'isActive': isActive,
      };
}
