import 'package:korbil_mobile/repos/api_service/api_service.dart';
import 'package:korbil_mobile/repos/api_service/endpoint_paths.dart';
import 'package:korbil_mobile/repos/api_service/models/data_state.dart';
import 'package:korbil_mobile/repos/api_service/models/res_state.dart';
import 'package:korbil_mobile/repos/package_repo/models/package.dart';
import 'package:korbil_mobile/repos/pref_storage_repo/pref_storage_repo.dart';

class PackageRepo {
  const PackageRepo(this.apiService, this.prefStorageRepo);
  final PrefStorageRepo prefStorageRepo;
  final ApiService apiService;

  Future<ResponseState<List<Package>>> getAllPackages() async {
    final res = await apiService.getReq(ApiPaths.getPackagesOfSchool('1'));
    if (res.data != null) {
      try {
        final jsonList =
            res.data!.data['response'].cast<Map<String, dynamic>>();
        final data = (jsonList as List).cast<Map<String, dynamic>>();
        final packages = List<Package>.from(
          data.map(Package.fromJson),
        );

        return ResponseSuccess(packages);
      } catch (e) {
        print('package repo: getallpackages:: $e');
        return ResponseFailed(DataError(null, e));
      }
    }
    return ResponseFailed(res.error!);
  }
}
