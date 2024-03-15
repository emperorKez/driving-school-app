part of 'metadata_cubit.dart';

@immutable
sealed class MetadataState {
  MetadataState(
      {this.transmisionTypes,
      this.languages,
      this.scheduleFlows,
      this.courseCategories,
      this.instructorTypes,
      this.helpTopics,
      this.feedbackCategories,
      this.documentTypes,
      this.staffRoles,
      this.locationTypes,});

  final List<String>? transmisionTypes;
  final List<Language>? languages;
  final List<ScheduleFlow>? scheduleFlows;
  final List<CourseCategory>? courseCategories;
  final List<InstructorType>? instructorTypes;
  final List<HelpTopic>? helpTopics;
  final List<String>? feedbackCategories;
  final List<DocumentType>? documentTypes;
  final List<StaffRole>? staffRoles;
  final List<LocationType>? locationTypes;
}

final class MetadataInitial extends MetadataState {}

final class MetadataLoading extends MetadataState {}

final class MetadataLoaded extends MetadataState {
  MetadataLoaded(
      {required super.transmisionTypes,
      required super.languages,
      required super.scheduleFlows,
      required super.courseCategories,
      required super.instructorTypes,
      required super.helpTopics,
      required super.feedbackCategories,
      required super.documentTypes,
      required super.staffRoles,
      required super.locationTypes,});
}

final class MetadataError extends MetadataState {
  MetadataError({this.error = 'Something went wrong'});

  final String error;
}
