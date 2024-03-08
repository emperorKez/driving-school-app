

// ignore_for_file: avoid_dynamic_calls

class SchoolInfo {
  SchoolInfo({
    this.id,
    this.name,
    this.description,
    this.address,
    this.city,
    this.phoneNumber,
    this.email,
    this.isFeatured,
    this.languages,
    this.staff,
    this.scheduleFlow,
    this.schoolStatus,
    this.primaryContact,
    this.instructorSelection,
    this.logo,
    this.vehicles,
    this.schoolLocations,
    this.schoolAvailableDates,
    this.schoolTimeOffDtos,
    this.documents,
    this.subscriptionLevel,
    this.courses,
    this.packages,
    this.offers,
    this.reviews,
    this.groupLessons,
    this.createdAt,
    this.updatedAt,
  });

  factory SchoolInfo.fromJson(Map<String, dynamic> json) => SchoolInfo(
        id: json['id'] as int?,
        name: json['name'] as String?,
        description: json['description'] as String?,
        address: json['address'] as String?,
        city: json['city'] as String,
        phoneNumber: json['phoneNumber'] as String?,
        email: json['email'] as String?,
        isFeatured: json['isFeatured'] as bool?,
        languages: json['languages'] == null
            ? []
            : List<int>.from(json['languages']!.map((int x) => x) as Iterable),
        staff: json['staff'] == null
            ? []
            : List<Staff>.from(
                json['staff']!.map(Staff.fromJson) as Iterable,
              ),
        scheduleFlow: json['scheduleFlow'] as int?,
        schoolStatus: json['schoolStatus'] as int?,
        primaryContact: json['primaryContact'] as int?,
        instructorSelection: json['instructorSelection'] as int?,
        logo: json['logo'] as String?,
        vehicles: json['vehicles'] == null
            ? []
            : List<Vehicle>.from(
                json['vehicles']!.map(Vehicle.fromJson) as Iterable,
              ),
        schoolLocations: json['schoolLocations'] == null
            ? []
            : List<SchoolLocation>.from(
                json['schoolLocations']!.map(SchoolLocation.fromJson)
                    as Iterable,
              ),
        schoolAvailableDates: json['schoolAvailableDates'] == null
            ? []
            : List<SchoolAvailableDate>.from(
                json['schoolAvailableDates']!.map(SchoolAvailableDate.fromJson)
                    as Iterable,
              ),
        schoolTimeOffDtos: json['schoolTimeOffDTOS'] == null
            ? []
            : List<SchoolTimeOffDto>.from(
                json['schoolTimeOffDTOS']!.map(SchoolTimeOffDto.fromJson)
                    as Iterable,
              ),
        documents: json['documents'] == null
            ? []
            : List<Document>.from(
                json['documents']!.map(Document.fromJson) as Iterable,
              ),
        subscriptionLevel: json['subscriptionLevel'] as int?,
        courses: json['courses'] == null
            ? []
            : List<Course>.from(
                json['courses']!.map(Course.fromJson) as Iterable,
              ),
        packages: json['packages'] == null
            ? []
            : List<Package>.from(
                json['packages']!.map(Package.fromJson) as Iterable,
              ),
        offers: json['offers'] == null
            ? []
            : List<Offer>.from(
                json['offers']!.map(Offer.fromJson) as Iterable,
              ),
        reviews: json['reviews'] == null
            ? []
            : List<Review>.from(
                json['reviews']!.map(Review.fromJson) as Iterable,
              ),
        groupLessons: json['groupLessons'] == null
            ? []
            : List<GroupLesson>.from(
                json['groupLessons']!.map(GroupLesson.fromJson) as Iterable,
              ),
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
      );
  int? id;
  String? name;
  String? description;
  String? address;
  String? city;
  String? phoneNumber;
  String? email;
  bool? isFeatured;
  List<int>? languages;
  List<Staff>? staff;
  int? scheduleFlow;
  int? schoolStatus;
  int? primaryContact;
  int? instructorSelection;
  String? logo;
  List<Vehicle>? vehicles;
  List<SchoolLocation>? schoolLocations;
  List<SchoolAvailableDate>? schoolAvailableDates;
  List<SchoolTimeOffDto>? schoolTimeOffDtos;
  List<Document>? documents;
  int? subscriptionLevel;
  List<Course>? courses;
  List<Package>? packages;
  List<Offer>? offers;
  List<Review>? reviews;
  List<GroupLesson>? groupLessons;
  DateTime? createdAt;
  DateTime? updatedAt;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'address': address,
        'city': city,
        'phoneNumber': phoneNumber,
        'email': email,
        'isFeatured': isFeatured,
        'languages': languages == null
            ? <int>[]
            : List<int>.from(languages!.map((x) => x)),
        'staff': staff == null
            ? <Staff>[]
            : List<Staff>.from(staff!.map((x) => x.toJson())),
        'scheduleFlow': scheduleFlow,
        'schoolStatus': schoolStatus,
        'primaryContact': primaryContact,
        'instructorSelection': instructorSelection,
        'logo': logo,
        'vehicles': vehicles == null
            ? <Vehicle>[]
            : List<Vehicle>.from(vehicles!.map((x) => x.toJson())),
        'schoolLocations': schoolLocations == null
            ? <SchoolLocation>[]
            : List<SchoolLocation>.from(
                schoolLocations!.map((x) => x.toJson())),
        'schoolAvailableDates': schoolAvailableDates == null
            ? <SchoolAvailableDate>[]
            : List<SchoolAvailableDate>.from(
                schoolAvailableDates!.map((x) => x.toJson())),
        'schoolTimeOffDTOS': schoolTimeOffDtos == null
            ? <SchoolTimeOffDto>[]
            : List<SchoolTimeOffDto>.from(
                schoolTimeOffDtos!.map((x) => x.toJson())),
        'documents': documents == null
            ? <Document>[]
            : List<Document>.from(documents!.map((x) => x.toJson())),
        'subscriptionLevel': subscriptionLevel,
        'courses': courses == null
            ? <Course>[]
            : List<Course>.from(courses!.map((x) => x.toJson())),
        'packages': packages == null
            ? <Package>[]
            : List<Package>.from(packages!.map((x) => x.toJson())),
        'offers': offers == null
            ? <Offer>[]
            : List<Offer>.from(offers!.map((x) => x.toJson())),
        'reviews': reviews == null
            ? <Review>[]
            : List<Review>.from(reviews!.map((x) => x.toJson())),
        'groupLessons': groupLessons == null
            ? <GroupLesson>[]
            : List<GroupLesson>.from(groupLessons!.map((x) => x.toJson())),
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
      };
}

class Course {
  Course({
    this.id,
    this.title,
    this.details,
    this.timeDuration,
    this.schoolId,
    this.courseCategory,
    this.courseTypeId,
    this.isActive,
    this.updated,
  });

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        id: json['id'] as int?,
        title: json['title'] as String?,
        details: json['details'] as String?,
        timeDuration: json['timeDuration'] as int?,
        schoolId: json['schoolId'] as int?,
        courseCategory: json['courseCategory'] == null
            ? null
            : CourseCategory.fromJson(
                json['courseCategory'] as Map<String, dynamic>,
              ),
        courseTypeId: json['courseTypeId'] as int?,
        isActive: json['isActive'] as bool?,
        updated: json['updated'] == null
            ? null
            : DateTime.parse(json['updated'] as String),
      );

  int? id;
  String? title;
  String? details;
  int? timeDuration;
  int? schoolId;
  CourseCategory? courseCategory;
  int? courseTypeId;
  bool? isActive;
  DateTime? updated;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'details': details,
        'timeDuration': timeDuration,
        'schoolId': schoolId,
        'courseCategory': courseCategory?.toJson(),
        'courseTypeId': courseTypeId,
        'isActive': isActive,
        'updated': updated?.toIso8601String(),
      };
}

class CourseCategory {
  CourseCategory({
    this.id,
    this.name, 
    this.icon,
  });

  factory CourseCategory.fromJson(Map<String, dynamic> json) => CourseCategory(
        id: json['id'] as int?,
        name: json['name'] as String?,
        icon: json['icon'] as String?,
      );

  int? id;
  String? name;
  String? icon;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'icon': icon,
      };
}

class Document {
  Document({
    this.id,
    this.key,
    this.type,
  });

  factory Document.fromJson(Map<String, dynamic> json) => Document(
        id: json['id'] as int?,
        key: json['key'] as String?,
        type: json['type'] as int?,
      );
  int? id;
  String? key;
  int? type;

  Map<String, dynamic> toJson() => {
        'id': id,
        'key': key,
        'type': type,
      };
}

class GroupLesson {
  GroupLesson({
    this.id,
    this.templateId,
    this.locationId,
    this.instructorId,
    this.date,
    this.startTime,
    this.endTime,
    this.seats,
    this.lessonStatus,
    this.groupLessonStudentRefs,
  });

  factory GroupLesson.fromJson(Map<String, dynamic> json) => GroupLesson(
        id: json['id'] as int?,
        templateId: json['templateId'] as int?,
        locationId: json['locationId'] as int?,
        instructorId: json['instructorId'] as int?,
        date: json['date'] == null
            ? null
            : DateTime.parse(json['date'] as String),
        startTime: json['startTime'] == null
            ? null
            : Time.fromJson(json['startTime'] as Map<String, dynamic>),
        endTime: json['endTime'] == null
            ? null
            : Time.fromJson(json['endTime'] as Map<String, dynamic>),
        seats: json['seats'] as int?,
        lessonStatus: json['lessonStatus'] as int?,
        groupLessonStudentRefs: json['groupLessonStudentRefs'] == null
            ? []
            : List<int>.from(
                json['groupLessonStudentRefs']!.map((int x) => x) as Iterable,
              ),
      );
  int? id;
  int? templateId;
  int? locationId;
  int? instructorId;
  DateTime? date;
  Time? startTime;
  Time? endTime;
  int? seats;
  int? lessonStatus;
  List<int>? groupLessonStudentRefs;

  Map<String, dynamic> toJson() => {
        'id': id,
        'templateId': templateId,
        'locationId': locationId,
        'instructorId': instructorId,
        'date': date?.toIso8601String(),
        'startTime': startTime?.toJson(),
        'endTime': endTime?.toJson(),
        'seats': seats,
        'lessonStatus': lessonStatus,
        'groupLessonStudentRefs': groupLessonStudentRefs == null
            ? <int>[]
            : List<int>.from(groupLessonStudentRefs!.map((x) => x)),
      };
}

class Time {
  Time({
    this.hour,
    this.minute,
    this.second,
    this.nano,
  });

  factory Time.fromJson(Map<String, dynamic> json) => Time(
        hour: json['hour'] as int?,
        minute: json['minute'] as int?,
        second: json['second'] as int?,
        nano: json['nano'] as int?,
      );
  int? hour;
  int? minute;
  int? second;
  int? nano;

  Map<String, dynamic> toJson() => {
        'hour': hour,
        'minute': minute,
        'second': second,
        'nano': nano,
      };
}

class Offer {
  Offer({
    this.id,
    this.packageId,
    this.schoolId,
    this.offer,
    this.startDate,
    this.endDate,
    this.details,
    this.promoteInHome,
    this.isActive,
  });

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
        id: json['id'] as int?,
        packageId: json['packageId'] as int?,
        schoolId: json['schoolId'] as int?,
        offer: json['offer'] as int?,
        startDate: json['startDate'] == null
            ? null
            : DateTime.parse(json['startDate'] as String),
        endDate: json['endDate'] == null
            ? null
            : DateTime.parse(json['endDate'] as String),
        details: json['details'] as String?,
        promoteInHome: json['promoteInHome'] as bool?,
        isActive: json['isActive'] as bool?,
      );
  int? id;
  int? packageId;
  int? schoolId;
  int? offer;
  DateTime? startDate;
  DateTime? endDate;
  String? details;
  bool? promoteInHome;
  bool? isActive;

  Map<String, dynamic> toJson() => {
        'id': id,
        'packageId': packageId,
        'schoolId': schoolId,
        'offer': offer,
        'startDate': startDate?.toIso8601String(),
        'endDate': endDate?.toIso8601String(),
        'details': details,
        'promoteInHome': promoteInHome,
        'isActive': isActive,
      };
}

class Package {
  Package({
    this.id,
    this.title,
    this.details,
    this.timeDuration,
    this.price,
    this.isRecommended,
    this.packageCourseSyllabus,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  factory Package.fromJson(Map<String, dynamic> json) => Package(
        id: json['id'] as int?,
        title: json['title'] as String?,
        details: json['details'] as String?,
        timeDuration: json['timeDuration'] as int?,
        price: json['price'] as int?,
        isRecommended: json['isRecommended'] as bool?,
        packageCourseSyllabus: json['packageCourseSyllabus'] == null
            ? []
            : List<PackageCourseSyllabus>.from(
                json['packageCourseSyllabus']!
                    .map(PackageCourseSyllabus.fromJson) as Iterable,
              ),
        isActive: json['isActive'] as bool?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
      );
  int? id;
  String? title;
  String? details;
  int? timeDuration;
  int? price;
  bool? isRecommended;
  List<PackageCourseSyllabus>? packageCourseSyllabus;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'details': details,
        'timeDuration': timeDuration,
        'price': price,
        'isRecommended': isRecommended,
        'packageCourseSyllabus': packageCourseSyllabus == null
            ? <PackageCourseSyllabus>[]
            : List<PackageCourseSyllabus>.from(packageCourseSyllabus!.map((x) => x.toJson())),
        'isActive': isActive,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
      };
}

class PackageCourseSyllabus {
  PackageCourseSyllabus({
    this.id,
    this.courseId,
  });

  factory PackageCourseSyllabus.fromJson(Map<String, dynamic> json) =>
      PackageCourseSyllabus(
        id: json['id'] as int?,
        courseId: json['courseId'] as int?,
      );
  int? id;
  int? courseId;

  Map<String, dynamic> toJson() => {
        'id': id,
        'courseId': courseId,
      };
}

class Review {
  Review({
    this.id,
    this.studentId,
    this.date,
    this.stars,
    this.comment,
    this.approved,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        id: json['id'] as int?,
        studentId: json['studentId'] as int?,
        date: json['date'] == null
            ? null
            : DateTime.parse(json['date'] as String),
        stars: json['stars'] as int?,
        comment: json['comment'] as String,
        approved: json['approved'] as bool?,
      );
  int? id;
  int? studentId;
  DateTime? date;
  int? stars;
  String? comment;
  bool? approved;

  Map<String, dynamic> toJson() => {
        'id': id,
        'studentId': studentId,
        'date': date?.toIso8601String(),
        'stars': stars,
        'comment': comment,
        'approved': approved,
      };
}

class SchoolAvailableDate {
  SchoolAvailableDate({
    this.id,
    this.weekday,
    this.availableHours,
  });

  factory SchoolAvailableDate.fromJson(Map<String, dynamic> json) =>
      SchoolAvailableDate(
        id: json['id'] as int?,
        weekday: json['weekday'] as int?,
        availableHours: json['availableHours'] == null
            ? []
            : List<AvailableHour>.from(
                json['availableHours']!.map(AvailableHour.fromJson) as Iterable,
              ),
      );
  int? id;
  int? weekday;
  List<AvailableHour>? availableHours;

  Map<String, dynamic> toJson() => {
        'id': id,
        'weekday': weekday,
        'availableHours': availableHours == null
            ? <AvailableHour>[]
            : List<AvailableHour>.from(availableHours!.map((x) => x.toJson())),
      };
}

class AvailableHour {
  AvailableHour({
    this.id,
    this.startTime,
    this.endTime,
  });

  factory AvailableHour.fromJson(Map<String, dynamic> json) => AvailableHour(
        id: json['id'] as int,
        startTime: json['startTime'].toString(),
        endTime: json['endTime'] as String,
      );
  int? id;
  String? startTime;
  String? endTime;

  Map<String, dynamic> toJson() => {
        'id': id,
        'startTime': startTime,
        'endTime': endTime,
      };
}

class SchoolLocation {
  SchoolLocation({
    this.id,
    this.name,
    this.address,
    this.city,
    this.postalCode,
    this.locationType,
    this.landmark,
  });

  factory SchoolLocation.fromJson(Map<String, dynamic> json) => SchoolLocation(
        id: json['id'] as int?,
        name: json['name'] as String?,
        address: json['address'] as String?,
        city: json['city'] as String?,
        postalCode: json['postalCode'] as String?,
        locationType: json['locationType'] as int?,
        landmark: json['landmark'] as String?,
      );
  int? id;
  String? name;
  String? address;
  String? city;
  String? postalCode;
  int? locationType;
  String? landmark;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'address': address,
        'city': city,
        'postalCode': postalCode,
        'locationType': locationType,
        'landmark': landmark,
      };
}

class SchoolTimeOffDto {
  SchoolTimeOffDto({
    this.id,
    this.date,
    this.name,
    this.startTime,
    this.endTime,
    this.schoolId,
  });

  factory SchoolTimeOffDto.fromJson(Map<String, dynamic> json) =>
      SchoolTimeOffDto(
        id: json['id'] as int?,
        date: json['date'] == null
            ? null
            : DateTime.parse(json['date'] as String),
        name: json['name'] as String?,
        startTime: json['startTime'] == null
            ? null
            : Time.fromJson(json['startTime'] as Map<String, dynamic>),
        endTime: json['endTime'] == null
            ? null
            : Time.fromJson(json['endTime'] as Map<String, dynamic>),
        schoolId: json['schoolId'] as int?,
      );

  int? id;
  DateTime? date;
  String? name;
  Time? startTime;
  Time? endTime;
  int? schoolId;

  Map<String, dynamic> toJson() => {
        'id': id,
        'date':
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        'name': name,
        'startTime': startTime?.toJson(),
        'endTime': endTime?.toJson(),
        'schoolId': schoolId,
      };
}

class Staff {
  Staff({
    this.profile,
    this.staffData,
  });

  factory Staff.fromJson(Map<String, dynamic> json) => Staff(
        profile: json['profile'] == null
            ? null
            : Profile.fromJson(json['profile'] as Map<String, dynamic>),
        staffData: json['staffData'] == null
            ? null
            : StaffData.fromJson(json['staffData'] as Map<String, dynamic>),
      );

  Profile? profile;
  StaffData? staffData;

  Map<String, dynamic> toJson() => {
        'profile': profile?.toJson(),
        'staffData': staffData?.toJson(),
      };
}

class Profile {
  Profile({
    this.id,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.email,
    this.avatar,
    this.userStatus,
    this.userType,
    this.createdAt,
    this.updatedAt,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json['id'] as int?,
        firstName: json['firstName'] as String?,
        lastName: json['lastName'] as String?,
        phoneNumber: json['phoneNumber'] as String?,
        email: json['email'] as String?,
        avatar: json['avatar'] as String?,
        userStatus: json['userStatus'] as int?,
        userType: json['userType'] as int?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
      );

  int? id;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? email;
  String? avatar;
  int? userStatus;
  int? userType;
  DateTime? createdAt;
  DateTime? updatedAt;

  Map<String, dynamic> toJson() => {
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'phoneNumber': phoneNumber,
        'email': email,
        'avatar': avatar,
        'userStatus': userStatus,
        'userType': userType,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
      };
}

class StaffData {
  StaffData({
    this.userProfileId,
    this.documents,
    this.staffRole,
    this.schoolId,
  });

  factory StaffData.fromJson(Map<String, dynamic> json) => StaffData(
        userProfileId: json['userProfileId'] as int?,
        documents: json['documents'] == null
            ? []
            : List<Document>.from(
                json['documents']!.map(Document.fromJson) as Iterable,
              ),
        staffRole: json['staffRole'] as int?,
        schoolId: json['schoolId'] as int?,
      );

  int? userProfileId;
  List<Document>? documents;
  int? staffRole;
  int? schoolId;

  Map<String, dynamic> toJson() => {
        'userProfileId': userProfileId,
        'documents': documents == null
            ? <Document>[]
            : List<Document>.from(documents!.map((x) => x.toJson())),
        'staffRole': staffRole,
        'schoolId': schoolId,
      };
}

class Vehicle {
  Vehicle({
    this.id,
    this.name,
    this.description,
    this.transmission,
    this.year,
    this.images,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
        id: json['id'] as int?,
        name: json['name'] as String?,
        description: json['description'] as String?,
        transmission: json['transmission'] as String?,
        year: json['year'] as String?,
        images: json['images'] == null
            ? []
            : List<VehicleImage>.from(
                json['images']!.map(VehicleImage.fromJson) as Iterable,
              ),
      );

  int? id;
  String? name;
  String? description;
  String? transmission;
  String? year;
  List<VehicleImage>? images;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'transmission': transmission,
        'year': year,
        'images': images == null
            ? <VehicleImage>[]
            : List<VehicleImage>.from(images!.map((x) => x.toJson())),
      };
}

class VehicleImage {
  VehicleImage({
    this.id,
    this.imageKey,
  });

  factory VehicleImage.fromJson(Map<String, dynamic> json) => VehicleImage(
        id: json['id'] as int?,
        imageKey: json['imageKey'] as String?,
      );
  int? id;
  String? imageKey;

  Map<String, dynamic> toJson() => {
        'id': id,
        'imageKey': imageKey,
      };
}
