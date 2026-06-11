import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_fruit_hub/data/repositories/auth_repository/auth_repository.dart';
import 'package:mvvm_fruit_hub/ui/auth/register/cubit/register_cubit.dart/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({required AuthRepository authRepo})
    : _authRepo = authRepo,
      super(InitialRegisterState());
  final AuthRepository _authRepo;

  Future<void> register({
    required String email,
    required String password,
  }) async {
    emit(LoadingRegisterState());
    var result = await _authRepo.createNewAccount(
      email: email,
      password: password,
    );
    result.fold(
      (failure) => emit(FailureRegisterState(errMessage: failure.message)),
      (success) => emit(SuccessRegisterState()),
    );
  }
}
