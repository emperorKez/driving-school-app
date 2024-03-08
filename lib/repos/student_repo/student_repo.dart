import 'package:korbil_mobile/repos/api_service/api_service.dart';
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
}