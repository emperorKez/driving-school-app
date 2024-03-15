class Package {
  Package({
    required this.schoolPackage,
    this.offer,
    this.endDate,
    this.discountedPrice,
  });

  factory Package.fromJson(Map<String, dynamic> json) => Package(
        schoolPackage: SchoolPackage.fromJson(
            json['schoolPackage'] as Map<String, dynamic>,),
        offer: json['offer'] as int,
        endDate: json['endDate'] == null
            ? null
            : DateTime.parse(json['endDate'] as String),
        discountedPrice: json['discountedPrice'] as int,
      );

  SchoolPackage schoolPackage;
  int? offer;
  DateTime? endDate;
  int? discountedPrice;

  Map<String, dynamic> toJson() => {
        'schoolPackage': schoolPackage.toJson(),
        'offer': offer,
        'endDate': endDate?.toIso8601String(),
        'discountedPrice': discountedPrice,
      };
}

class SchoolPackage {
  SchoolPackage({
    required this.id,
    required this.title,
    required this.description,
    required this.details,
    required this.timeDuration,
    required this.price,
    required this.packageCourseSyllabus,
    this.isRecommended,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  factory SchoolPackage.fromJson(Map<String, dynamic> json) => SchoolPackage(
        id: json['id'] as int,
        title: json['title'] as String,
        description: json['description'] as String,
        details: json['details'] as String,
        timeDuration: json['timeDuration'] as int,
        price: json['price'] as int,
        isRecommended: json['isRecommended'] as bool,
        packageCourseSyllabus: json['packageCourseSyllabus'] == null
            ? []
            : List<PackageCourseSyllabus>.from(
                json['packageCourseSyllabus']!
                    .map(PackageCourseSyllabus.fromJson) as Iterable,
              ),
        isActive: json['isActive'] as bool,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
      );

  int id;
  String title;
  String description;
  String details;
  int timeDuration;
  int price;
  bool? isRecommended;
  List<PackageCourseSyllabus> packageCourseSyllabus;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'details': details,
        'timeDuration': timeDuration,
        'price': price,
        'isRecommended': isRecommended,
        'packageCourseSyllabus':
            List<dynamic>.from(packageCourseSyllabus.map((x) => x.toJson())),
        'isActive': isActive,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
      };
}

class PackageCourseSyllabus {
  PackageCourseSyllabus({
    required this.id,
    required this.courseId,
  });

  factory PackageCourseSyllabus.fromJson(Map<String, dynamic> json) =>
      PackageCourseSyllabus(
        id: json['id'] as int,
        courseId: json['courseId'] as int,
      );

  int id;
  int courseId;

  Map<String, dynamic> toJson() => {
        'id': id,
        'courseId': courseId,
      };
}
