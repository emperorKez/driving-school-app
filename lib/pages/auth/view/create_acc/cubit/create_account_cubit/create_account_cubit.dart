import 'package:bloc/bloc.dart';
import 'package:korbil_mobile/repos/auth_repo/auth_repo.dart';
import 'package:meta/meta.dart';

part 'create_account_state.dart';

class CreateAccountCubit extends Cubit<CreateAccountState> {
  CreateAccountCubit({AuthRepo? authRepo}) :_authRepo =authRepo ?? AuthRepo(), super(CreateAccountInitial());
  final AuthRepo _authRepo;
  Future<void> createAccount(Map<String, dynamic> payload) async {
    emit(CreateAccountLoading());
    try {
      var response = await _authRepo.registerUser(payload);      
        emit(CreateAccountSuccess());
        } catch (e) {
      emit(CreateAccountError(error: e.toString()));
      
    }
  }
}
