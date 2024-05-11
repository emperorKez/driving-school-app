class Package {
  Package({
    required this.schoolPackage,
    required this.offer,
    required this.endDate,
    required this.discountedPrice,
  });

  factory Package.fromJson(Map<String, dynamic> json) => Package(
        schoolPackage: SchoolPackage.fromJson(
          json['schoolPackage'] as Map<String, dynamic>,
        ),
        offer: json['offer'] as double,
        endDate: DateTime.parse(json['endDate'] as String),
        discountedPrice: json['discountedPrice'] as int,
      );

  SchoolPackage schoolPackage;
  double offer;
  DateTime endDate;
  int discountedPrice;

  Map<String, dynamic> toJson() => {
        'schoolPackage': schoolPackage.toJson(),
        'offer': offer,
        'endDate': endDate.toIso8601String(),
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
    required this.isRecommended,
    required this.schoolId,
    required this.packageCourseSyllabus,
    required this.isActive,
  });

  factory SchoolPackage.fromJson(Map<String, dynamic> json) => SchoolPackage(
        id: json['id'] as int,
        title: json['title'] as String,
        description: json['description'] as String,
        details: List<dynamic>.from(
            json['details'].map((dynamic x) => x) as Iterable,),
        timeDuration: json['timeDuration'] as int,
        price: json['price'] as int,
        isRecommended: json['isRecommended'] as bool,
        schoolId: json['schoolId'] as int,
        packageCourseSyllabus: List<PackageCourseSyllabus>.from(
          json['packageCourseSyllabus'].map(PackageCourseSyllabus.fromJson)
              as Iterable,
        ),
        isActive: json['isActive'] as bool,
      );

  int id;
  String title;
  String description;
  List<dynamic> details;
  int timeDuration;
  int price;
  bool isRecommended;
  int schoolId;
  List<PackageCourseSyllabus> packageCourseSyllabus;
  bool isActive;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'details': details,
        'timeDuration': timeDuration,
        'price': price,
        'isRecommended': isRecommended,
        'schoolId': schoolId,
        'packageCourseSyllabus':
            List<dynamic>.from(packageCourseSyllabus.map((x) => x.toJson())),
        'isActive': isActive,
      };
}

class PackageCourseSyllabus {
  PackageCourseSyllabus({
    required this.id,
    required this.courseId,
  });

  factory PackageCourseSyllabus.fromJson(dynamic json) => PackageCourseSyllabus(
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
