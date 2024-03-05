import 'package:bloc/bloc.dart';
import 'package:korbil_mobile/repos/package_repo/models/package.dart';
import 'package:korbil_mobile/repos/package_repo/package_repo.dart';
import 'package:meta/meta.dart';

part 'package_event.dart';
part 'package_state.dart';

class PackageBloc extends Bloc<PackageEvent, PackagesState> {
  PackageBloc(this.packageRepo) : super(PackagesInitial()) {
    on<GetAllPackages>(_getAllPackages);
    on<ClearErrorMsg>(_clearErrorMsg);
  }
  final PackageRepo packageRepo;

  void _getAllPackages(
      GetAllPackages event, Emitter<PackagesState> emit) async {
    emit(PackagesFetching());
    final resState = await packageRepo.getAllPackages();
    if (resState.data == null) {
      return emit(PackagesFetchError(resState.error?.error.toString()));
    } else {
      return emit(PackagesFetched(resState.data!));
    }
  }

  void _clearErrorMsg(ClearErrorMsg event, Emitter<PackagesState> emit) async {
    emit(PackagesInitial());
  }
}
