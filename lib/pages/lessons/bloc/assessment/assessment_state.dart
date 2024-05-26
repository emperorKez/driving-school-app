// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'assessment_bloc.dart';

// @immutable
// sealed
class AssessmentState {
  AssessmentState(
      {required this.goodAtManeuvering,
      required this.badAtManeuvering,
      required this.goodAtVehicleKnowledge,
      required this.badAtVehicleKnowledge,
      required this.goodAtEcoFriendly,
      required this.badAtEcoFriendly,
      required this.goodAtRoadRules,
      required this.badAtRoadRules,
      required this.badAtRoadSafety,
      required this.goodAtRoadSafety,
      required this.feedback,});

  final Set<Assessment> goodAtManeuvering;
  final Set<Assessment> badAtManeuvering;
  final Set<Assessment> goodAtVehicleKnowledge;
  final Set<Assessment> badAtVehicleKnowledge;
  final Set<Assessment> goodAtEcoFriendly;
  final Set<Assessment> badAtEcoFriendly;
  final Set<Assessment> goodAtRoadRules;
  final Set<Assessment> badAtRoadRules;
  final Set<Assessment> badAtRoadSafety;
  final Set<Assessment> goodAtRoadSafety;
  final String? feedback;

  AssessmentState copyWith({
    Set<Assessment>? goodAtManeuvering,
    Set<Assessment>? badAtManeuvering,
    Set<Assessment>? goodAtVehicleKnowledge,
    Set<Assessment>? badAtVehicleKnowledge,
    Set<Assessment>? goodAtEcoFriendly,
    Set<Assessment>? badAtEcoFriendly,
    Set<Assessment>? badAtRoadRules,
    Set<Assessment>? goodAtRoadRules,
    Set<Assessment>? goodAtRoadSafety,
    Set<Assessment>? badAtRoadSafety,
    String? feedback,
  }) {
    return AssessmentState(
      goodAtManeuvering: goodAtManeuvering ?? this.goodAtManeuvering,
      badAtManeuvering: badAtManeuvering ?? this.badAtManeuvering,
      goodAtVehicleKnowledge:
          goodAtVehicleKnowledge ?? this.goodAtVehicleKnowledge,
      badAtVehicleKnowledge:
          badAtVehicleKnowledge ?? this.badAtVehicleKnowledge,
      goodAtEcoFriendly: goodAtEcoFriendly ?? this.goodAtEcoFriendly,
      badAtEcoFriendly: badAtEcoFriendly ?? this.badAtEcoFriendly,
      goodAtRoadRules: goodAtRoadRules ?? this.goodAtRoadRules,
      badAtRoadRules: badAtRoadRules ?? this.badAtRoadRules,
      goodAtRoadSafety: goodAtRoadSafety ?? this.goodAtRoadSafety,
      badAtRoadSafety: badAtRoadSafety ?? this.badAtRoadSafety,
      feedback: feedback ?? this.feedback,
    );
  }
}

final class AssessmentInitial extends AssessmentState {
  AssessmentInitial()
      : super(
            goodAtManeuvering: {},
            badAtManeuvering: {},
            goodAtEcoFriendly: {},
            badAtEcoFriendly: {},
            goodAtVehicleKnowledge: {},
            badAtVehicleKnowledge: {},
            goodAtRoadRules: {},
            badAtRoadRules: {},
            goodAtRoadSafety: {},
            badAtRoadSafety: {},
            feedback: '',);
}

// class AssessmentFinished extends AssessmentState {
//   AssessmentFinished(
//       {required super.goodAtManeuvering,
//       required super.badAtManeuvering,
//       required super.goodAtVehicleKnowledge,
//       required super.badAtVehicleKnowledge,
//       required super.goodAtEcoFriendly,
//       required super.badAtEcoFriendly,
//       required super.goodAtRoadRules,
//       required super.badAtRoadRules,
//       required super.badAtRoadSafety,
//       required super.goodAtRoadSafety,
//       required super.feedback});
// }

class Assessment {
  Assessment({required this.subCategory, required this.categoryId});

  final SubCategory subCategory;
  final int categoryId;
}
