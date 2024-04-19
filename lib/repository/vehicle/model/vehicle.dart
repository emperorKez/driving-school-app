// ignore_for_file: avoid_dynamic_calls

class Vehicle {
  Vehicle({
    required this.id,
    required this.name,
    required this.description,
    required this.transmission,
    required this.year,
    required this.schoolId,
    required this.images,
    required this.isActive,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
        id: json['id'] as int,
        name: json['name'] as String,
        description: json['description'] as String,
        transmission: json['transmission'] as String,
        year: json['year'] as String,
        schoolId: json['schoolId'] as int,
        images: List<VehicleImage>.from(
            json['images'].map(VehicleImage.fromJson) as Iterable,),
        isActive: json['isActive'] as bool,
      );

  int id;
  String name;
  String description;
  String transmission;
  String year;
  int schoolId;
  List<VehicleImage> images;
  bool isActive;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'transmission': transmission,
        'year': year,
        'schoolId': schoolId,
        'images': List<dynamic>.from(images.map((x) => x.toJson())),
        'isActive': isActive,
      };
}

class VehicleImage {
  VehicleImage({
    required this.id,
    required this.imageKey,
  });

  factory VehicleImage.fromJson(dynamic json) => VehicleImage(
        id: json['id'] as int,
        imageKey: json['imageKey'] as String,
      );

  int id;
  String imageKey;

  Map<String, dynamic> toJson() => {
        'id': id,
        'imageKey': imageKey,
      };
}
