// ignore_for_file: avoid_dynamic_calls

import 'package:korbil_mobile/repository/api_service/api_service.dart';
import 'package:korbil_mobile/repository/api_service/endpoint_paths.dart';
import 'package:korbil_mobile/repository/api_service/models/data_state.dart';
import 'package:korbil_mobile/repository/api_service/models/res_state.dart';
import 'package:korbil_mobile/repository/course/model/course.dart';
import 'package:korbil_mobile/repository/metadata/models/document_type.dart';
import 'package:korbil_mobile/repository/metadata/models/help_topic.dart';
import 'package:korbil_mobile/repository/metadata/models/instructor_type.dart';
import 'package:korbil_mobile/repository/metadata/models/language.dart';
import 'package:korbil_mobile/repository/metadata/models/location_type.dart';
import 'package:korbil_mobile/repository/metadata/models/schedule_flow.dart';
import 'package:korbil_mobile/repository/metadata/models/staff_role.dart';

class MetadataRepo {
  final ApiService apiService = ApiService();

  Future<ResponseState<List<Language>>> getAllLanguages() async {
    final response = await apiService.getReq(ApiPaths.getAllLanguages);
    if (response.data != null) {
      try {
        final jsonList = response.data!.data['response'];
        final data = (jsonList as List).cast<Map<String, dynamic>>();
        final languages = List<Language>.from(
          data.map(Language.fromJson),
        );
        return ResponseSuccess(languages);
      } catch (e) {
        return ResponseFailed(DataError(null, e));
      }
    }
    return ResponseFailed(response.error!);
  }

  Future<ResponseState<List<ScheduleFlow>>> getScheduleFlow() async {
    final response = await apiService.getReq(ApiPaths.getScheduleFlow);
    if (response.data != null) {
      try {
        final jsonList = response.data!.data['response'];
        final data = (jsonList as List).cast<Map<String, dynamic>>();
        final scheduleFlow = List<ScheduleFlow>.from(
          data.map(ScheduleFlow.fromJson),
        );
        return ResponseSuccess(scheduleFlow);
      } catch (e) {
        return ResponseFailed(DataError(null, e));
      }
    }
    return ResponseFailed(response.error!);
  }

  Future<ResponseState<List<CourseCategory>>> getAllCourseCategories() async {
    final response = await apiService.getReq(ApiPaths.getAllCourseCategories);
    if (response.data != null) {
      try {
        final jsonList = response.data!.data['response'];
        final data = (jsonList as List).cast<Map<String, dynamic>>();
        final categories = List<CourseCategory>.from(
          data.map(CourseCategory.fromJson),
        );
        return ResponseSuccess(categories);
      } catch (e) {
        return ResponseFailed(DataError(null, e));
      }
    }
    return ResponseFailed(response.error!);
  }

  Future<ResponseState<List<InstructorType>>>
      getAllinstructorSelectionType() async {
    final response =
        await apiService.getReq(ApiPaths.getAllinstructorSelectionType);
    if (response.data != null) {
      try {
        final jsonList = response.data!.data['response'];
        final data = (jsonList as List).cast<Map<String, dynamic>>();
        final categories = List<InstructorType>.from(
          data.map(InstructorType.fromJson),
        );
        return ResponseSuccess(categories);
      } catch (e) {
        return ResponseFailed(DataError(null, e));
      }
    }
    return ResponseFailed(response.error!);
  }

  Future<ResponseState<List<HelpTopic>>> getAllHelpTopics() async {
    final params = {'languageId': 1};
    final response =
        await apiService.getReq(ApiPaths.getAllHelpTopics, params: params);
    if (response.data != null) {
      try {
        final jsonList = response.data!.data['response'];
        final data = (jsonList as List).cast<Map<String, dynamic>>();
        final helpTopics = List<HelpTopic>.from(
          data.map(HelpTopic.fromJson),
        );
        return ResponseSuccess(helpTopics);
      } catch (e) {
        return ResponseFailed(DataError(null, e));
      }
    }
    return ResponseFailed(response.error!);
  }

  Future<ResponseState<List<String>>> getFeedbackCategories() async {
    final response =
        await apiService.getReq(ApiPaths.getAllAppFeedbackCategories);
    if (response.data != null) {
      try {
        final jsonList = response.data!.data['response'];
        final data = (jsonList as List).cast<String>();
        return ResponseSuccess(data);
      } catch (e) {
        return ResponseFailed(DataError(null, e));
      }
    }
    return ResponseFailed(response.error!);
  }

  Future<ResponseState<List<String>>> getVehicleTransmissionTypes() async {
    final response =
        await apiService.getReq(ApiPaths.getVehicleTransmissionTypes);
    if (response.data != null) {
      try {
        final jsonList = response.data!.data['response'];
        final data = (jsonList as List).cast<String>();
        return ResponseSuccess(data);
      } catch (e) {
        return ResponseFailed(DataError(null, e));
      }
    }
    return ResponseFailed(response.error!);
  }

  Future<ResponseState<List<DocumentType>>> getDocumentTypes() async {
    final response = await apiService.getReq(ApiPaths.getAllDocumentType);
    try {
      if (response.data != null) {
        final jsonList = response.data!.data['response'];
        final data = (jsonList as List).cast<Map<String, dynamic>>();
        final documentTypes = List<DocumentType>.from(
          data.map(DocumentType.fromJson),
        );
        return ResponseSuccess(documentTypes);
      }
      return ResponseFailed(response.error!);
    } catch (e) {
      return ResponseFailed(DataError(null, e));
    }
  }

  Future<ResponseState<List<StaffRole>>> getAllStaffRoles() async {
    final response = await apiService.getReq(ApiPaths.getAllStaffRoles);

    try {
      if (response.data != null) {
        final jsonList = response.data!.data['response'];
        final data = (jsonList as List).cast<Map<String, dynamic>>();
        final staffRoles = List<StaffRole>.from(
          data.map(StaffRole.fromJson),
        );
        return ResponseSuccess(staffRoles);
      }
      return ResponseFailed(response.error!);
    } catch (e) {
      return ResponseFailed(DataError(null, e));
    }
  }

  Future<ResponseState<List<LocationType>>> getLocationType() async {
    final response = await apiService.getReq(ApiPaths.getLocationType);

    try {
      if (response.data != null) {
        final jsonList = response.data!.data['response'];
        final data = (jsonList as List).cast<Map<String, dynamic>>();
        final locationTypes = List<LocationType>.from(
          data.map(LocationType.fromJson),
        );
        return ResponseSuccess(locationTypes);
      }
      return ResponseFailed(response.error!);
    } catch (e) {
      return ResponseFailed(DataError(null, e));
    }
  }
}
