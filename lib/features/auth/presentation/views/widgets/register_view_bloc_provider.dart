import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_fruit_hub/core/services/get_it_service.dart';
import 'package:mvvm_fruit_hub/features/auth/data/repositories/auth_repo.dart';
import 'package:mvvm_fruit_hub/features/auth/presentation/logic/register_cubit.dart/register_cubit.dart';

class RegisterViewBlocProvider extends StatelessWidget {
  const RegisterViewBlocProvider({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(authRepo: getIt.get<AuthRepo>()),
      child: child,
    );
  }
}
