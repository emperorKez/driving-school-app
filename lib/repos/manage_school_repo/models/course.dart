class Course {
 Course({
        required this.course,
        required this.courseCategory,
        required this.courseType,
    });

    factory Course.fromJson(Map<String, dynamic> json) => Course(
        course: CourseClass.fromJson(json['course'] as Map<String, dynamic>),
        courseCategory: CourseCategory.fromJson(json['courseCategory'] as Map<String, dynamic>),
        courseType: json['courseType'] as String,
    );

    CourseClass course;
    CourseCategory courseCategory;
    String courseType;

    Map<String, dynamic> toJson() => {
        'course': course.toJson(),
        'courseCategory': courseCategory.toJson(),
        'courseType': courseType,
    };
}

class CourseClass {
      CourseClass({
        required this.id,
        required this.title,
        required this.details,
        required this.timeDuration,
        required this.schoolId,
        required this.isActive,
        required this.createdAt,
        required this.updatedAt,
    });

    factory CourseClass.fromJson(Map<String, dynamic> json) => CourseClass(
        id: json['id'] as int,
        title: json['title'] as String,
        details: json['details'] as String,
        timeDuration: json['timeDuration'] as int,
        schoolId: json['schoolId'] as int,
        isActive: json['isActive'] as  bool,
        createdAt: DateTime.parse(json['createdAt'] as String),
        updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

     int id;
    String title;
    String details;
    int timeDuration;
    int schoolId;
    bool isActive;
    DateTime createdAt;
    DateTime updatedAt;

    Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'details': details,
        'timeDuration': timeDuration,
        'schoolId': schoolId,
        'isActive': isActive,
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
    };
}

class CourseCategory {

    CourseCategory({
        required this.id,
        required this.name,
        required this.icon,
    });

    factory CourseCategory.fromJson(Map<String, dynamic> json) => CourseCategory(
        id: json['id'] as int,
        name: json['name'] as String,
        icon: json['icon'] as String,
    );

    int id;
    String name;
    String icon;

    Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'icon': icon,
    };
}
