import 'package:get_it/get_it.dart';
import 'package:korbil_mobile/nav/nav_service.dart';
import 'package:korbil_mobile/repository/api_service/api_service.dart';
import 'package:korbil_mobile/repository/pref_storage_repo/pref_storage_repo.dart';
import 'package:korbil_mobile/repository/school_info/school_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

final lc = GetIt.instance;

Future<void> initializeDependencies() async {
  final prefs = await SharedPreferences.getInstance();
  // navigation service
  lc..registerLazySingleton(NavigationService.new)
  // api service
  ..registerLazySingleton(ApiService.new)
  // pref storage service
  ..registerLazySingleton(() => PrefStorageRepo(prefs))
  //manage school repo
  ..registerLazySingleton(SchoolRepo.new)
  //package repo
  // ..registerLazySingleton(() => PackageRepo(lc(), lc()))
  ;
}
