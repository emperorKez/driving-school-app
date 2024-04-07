import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:korbil_mobile/repository/course/model/course.dart';
import 'package:korbil_mobile/repository/metadata/metadata_repo.dart';
import 'package:korbil_mobile/repository/metadata/models/document_type.dart';
import 'package:korbil_mobile/repository/metadata/models/help_topic.dart';
import 'package:korbil_mobile/repository/metadata/models/instructor_type.dart';
import 'package:korbil_mobile/repository/metadata/models/language.dart';
import 'package:korbil_mobile/repository/metadata/models/location_type.dart';
import 'package:korbil_mobile/repository/metadata/models/schedule_flow.dart';
import 'package:korbil_mobile/repository/metadata/models/staff_role.dart';

part 'metadata_state.dart';

class MetadataCubit extends Cubit<MetadataState> {
  MetadataCubit({MetadataRepo? metadataRepo})
      : _metadataRepo = metadataRepo ?? MetadataRepo(),
        super(MetadataInitial());

  Future<void> getMetadata() async {
    emit(MetadataInitial());
    try {
      final languageRes = await _metadataRepo.getAllLanguages();
      final helpTopicsRes = await _metadataRepo.getAllHelpTopics();
      // final feedbackCatgoriesRes = await _metadataRepo.getFeedbackCategories();
      final locationTypeRes = await _metadataRepo.getLocationType();
      final courseCategoryRes = await _metadataRepo.getAllCourseCategories();
      final documentTypeRes = await _metadataRepo.getDocumentTypes();
      final scheduleFlowRes = await _metadataRepo.getScheduleFlow();
      final instructorTypeRes =
          await _metadataRepo.getAllinstructorSelectionType();
      final staffRoleRes = await _metadataRepo.getAllStaffRoles();
      final transmissionTypeRes =
          await _metadataRepo.getVehicleTransmissionTypes();
      emit(MetadataLoaded(
          transmisionTypes: transmissionTypeRes.data,
          languages: languageRes.data,
          scheduleFlows: scheduleFlowRes.data,
          courseCategories: courseCategoryRes.data,
          instructorTypes: instructorTypeRes.data,
          helpTopics: helpTopicsRes.data,
          // feedbackCategories: feedbackCatgoriesRes.data,
          feedbackCategories: const [],
          documentTypes: documentTypeRes.data,
          staffRoles: staffRoleRes.data,
          locationTypes: locationTypeRes.data,),);
    } catch (e) {
      emit(MetadataError(error: e.toString()));
    }
  }

  final MetadataRepo _metadataRepo;
}
