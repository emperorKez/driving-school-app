// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'assessment_bloc.dart';

// @immutable
// sealed
class AssessmentState {
  AssessmentState({required this.maneuvering, required this.vehicleKnowledge, required this.feedback});

  final List<String> maneuvering;
  final List<String> vehicleKnowledge;
  final String feedback;

  AssessmentState copyWith(
      {List<String>? maneuvering, List<String>? vehicleKnowledge, String? feedback,}) {
    return AssessmentState(
        maneuvering: maneuvering ?? this.maneuvering,
        vehicleKnowledge: vehicleKnowledge ?? this.vehicleKnowledge, feedback: feedback?? this.feedback,);
  }
}

final class AssessmentInitial extends AssessmentState {
  AssessmentInitial() : super(maneuvering: [], vehicleKnowledge: [], feedback: '');
}
