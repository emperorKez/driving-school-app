class Promotion {
    Promotion({
        required this.schoolPackageId,
        required this.offer,
        required this.startDate,
        required this.endDate,
        required this.details,
        required this.promoteInHome,
    });

    factory Promotion.fromJson(Map<String, dynamic> json) => Promotion(
        schoolPackageId: json['schoolPackageId'] as int,
        offer: json['offer'] as int,
        startDate: DateTime.parse(json['startDate'] as String),
        endDate: DateTime.parse(json['endDate'] as String),
        details: json['details'] as String,
        promoteInHome: json['promoteInHome'] as bool,
    );

int schoolPackageId;
    int offer;
    DateTime startDate;
    DateTime endDate;
    String details;
    bool promoteInHome;

    Map<String, dynamic> toJson() => {
        'schoolPackageId': schoolPackageId,
        'offer': offer,
        'startDate': startDate.toIso8601String(),
        'endDate': endDate.toIso8601String(),
        'details': details,
        'promoteInHome': promoteInHome,
    };
}
