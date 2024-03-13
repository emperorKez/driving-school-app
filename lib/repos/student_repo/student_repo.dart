import 'package:korbil_mobile/repos/api_service/api_service.dart';
import 'package:korbil_mobile/repos/api_service/endpoint_paths.dart';
import 'package:korbil_mobile/repos/api_service/models/data_state.dart';
import 'package:korbil_mobile/repos/api_service/models/res_state.dart';
import 'package:korbil_mobile/repos/student_repo/models/student.dart';
class StudentRepo{
  final ApiService apiService = ApiService();

  // Future<ResponseState<Student>> createStudent(String schoolId) async {
  //   final res = await apiService.postReq(ApiPaths.cre);
  //   if (res.data != null) {
  //     try {
  //       final data = res.data!.data['response'];
  //       final groupLesson = data.map(Student.fromJson) as Student;
  //       return ResponseSuccess(groupLesson);
  //     } catch (e) {
  //       return ResponseFailed(DataError(null, e));
  //     }
  //   }
  //   return ResponseFailed(res.error!);
  // }


  Future<ResponseState<List<Student>>> getAllStudent(int schoolId) async {
    final res = await apiService.getReq(ApiPaths.getStudents);
    if (res.data != null) {
      try {
        final jsonList = res.data!.data['response'];
        final data = (jsonList as List).cast<Map<String, dynamic>>();
         final students = List<Student>.from(
          data.map(Student.fromJson),);
        return ResponseSuccess(students);
      } catch (e) {
        return ResponseFailed(DataError(null, e));
      }
    }
    return ResponseFailed(res.error!);
  }


}