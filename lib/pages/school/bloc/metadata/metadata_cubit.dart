import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:korbil_mobile/repos/metadata_repo/metadata_repo.dart';
import 'package:korbil_mobile/repos/metadata_repo/models/document_type.dart';
import 'package:korbil_mobile/repos/metadata_repo/models/help_topic.dart';
import 'package:korbil_mobile/repos/metadata_repo/models/instructor_type.dart';
import 'package:korbil_mobile/repos/metadata_repo/models/language.dart';
import 'package:korbil_mobile/repos/metadata_repo/models/location_type.dart';
import 'package:korbil_mobile/repos/metadata_repo/models/schedule_flow.dart';
import 'package:korbil_mobile/repos/metadata_repo/models/staff_role.dart';
import 'package:korbil_mobile/repos/school_repo/models/course.dart';

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
      final feedbackCatgoriesRes = await _metadataRepo.getFeedbackCategories();
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
          feedbackCategories: feedbackCatgoriesRes.data,
          documentTypes: documentTypeRes.data,
          staffRoles: staffRoleRes.data,
          locationTypes: locationTypeRes.data,),);
    } catch (e) {
      emit(MetadataError(error: e.toString()));
    }
  }

  final MetadataRepo _metadataRepo;
}
