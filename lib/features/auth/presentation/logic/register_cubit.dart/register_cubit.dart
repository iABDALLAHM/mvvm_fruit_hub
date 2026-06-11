import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_fruit_hub/features/auth/data/repositories/auth_repo.dart';
import 'package:mvvm_fruit_hub/features/auth/presentation/logic/register_cubit.dart/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({required AuthRepo authRepo})
    : _authRepo = authRepo,
      super(InitialRegisterState());
  final AuthRepo _authRepo;

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
