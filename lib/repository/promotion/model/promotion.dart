class Promotion {
  Promotion({
    required this.id,
    required this.schoolPackageId,
    required this.schoolId,
    required this.offer,
    required this.startDate,
    required this.endDate,
    required this.details,
    required this.promoteInHome,
    required this.isActive,
  });

  factory Promotion.fromJson(Map<String, dynamic> json) => Promotion(
        id: json['id'] as int,
        schoolPackageId: json['schoolPackageId'] as int,
        schoolId: json['schoolId'] as int,
        offer: json['offer'] as int,
        startDate: DateTime.parse(json['startDate'] as String),
        endDate: DateTime.parse(json['endDate'] as String),
        details: json['details'] as String,
        promoteInHome: json['promoteInHome'] as bool,
        isActive: json['isActive'] as bool,
      );

  int id;
  int schoolPackageId;
  int schoolId;
  int offer;
  DateTime startDate;
  DateTime endDate;
  String details;
  bool promoteInHome;
  bool isActive;

  Map<String, dynamic> toJson() => {
        'id': id,
        'schoolPackageId': schoolPackageId,
        'schoolId': schoolId,
        'offer': offer,
        'startDate': startDate..toIso8601String(),
        'endDate': endDate..toIso8601String(),
        'details': details,
        'promoteInHome': promoteInHome,
        'isActive': isActive,
      };
}
