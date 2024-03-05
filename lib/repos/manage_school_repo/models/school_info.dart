// ignore_for_file: avoid_dynamic_calls

import 'dart:convert';

class SchoolInfo {
  SchoolInfo({
    required this.name,
    required this.logo,
    required this.address,
    this.email,
    this.description,
    required this.phoneNumber,
    required this.aboutUs,
    required this.reviewCount,
    required this.vehicles,
    required this.onGoingOffers,
    required this.team,
    required this.packages,
    required this.reviews,
    required this.groupLessons,
  });

  String? name;
  dynamic logo;
  String? address;
  String? phoneNumber;
  String? description;
  String? aboutUs;
  String? email;
  int reviewCount;
  List<dynamic> vehicles;
  List<dynamic> onGoingOffers;
  List<dynamic> team;
  List<dynamic> packages;
  List<dynamic> reviews;
  List<dynamic> groupLessons;

  factory SchoolInfo.fromRawJson(String str) =>
      SchoolInfo.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  factory SchoolInfo.fromJson(Map<String, dynamic> json) => SchoolInfo(
        name: json['name'] as String?,
        logo: json['logo'],
        address: json['address'] as String?,
        description: json['description'] as String?,
        email: json['email'] as String?,
        phoneNumber: json['phoneNumber'] as String?,
        aboutUs: json['aboutUs'] as String?,
        reviewCount: json['reviewCount'] as int? ?? 0,
        // vehicles: List<dynamic>.from(json['vehicles'].map((dynamic x) => x) as List<dynamic>) ,
        vehicles: [],
        onGoingOffers: [],
        team: [],
        packages: [],
        reviews: [],
        groupLessons: [],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "logo": logo,
        "address": address,
        "email": email,
        "description": description,
        "phoneNumber": phoneNumber,
        "aboutUs": aboutUs,
        "reviewCount": reviewCount,
        "vehicles": List<dynamic>.from(vehicles.map((x) => x)),
        "onGoingOffers": List<dynamic>.from(onGoingOffers.map((x) => x)),
        "team": List<dynamic>.from(team.map((x) => x)),
        "packages": List<dynamic>.from(packages.map((x) => x)),
        "reviews": List<dynamic>.from(reviews.map((x) => x)),
        "groupLessons": List<dynamic>.from(groupLessons.map((x) => x)),
      };
}
