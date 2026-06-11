import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_fruit_hub/data/services/get_it/get_it_service.dart';
import 'package:mvvm_fruit_hub/data/repositories/auth_repository/auth_repository.dart';
import 'package:mvvm_fruit_hub/presentation/auth/register/cubit/register_cubit.dart/register_cubit.dart';

class RegisterViewBlocProvider extends StatelessWidget {
  const RegisterViewBlocProvider({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(authRepo: getIt.get<AuthRepository>()),
      child: child,
    );
  }
}
