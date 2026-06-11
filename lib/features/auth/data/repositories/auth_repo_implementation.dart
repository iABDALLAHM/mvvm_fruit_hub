import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mvvm_fruit_hub/core/errors/custom_exception.dart';
import 'package:mvvm_fruit_hub/core/errors/failures.dart';
import 'package:mvvm_fruit_hub/core/errors/server_failure.dart';
import 'package:mvvm_fruit_hub/features/auth/data/repositories/auth_repo.dart';
import 'package:mvvm_fruit_hub/features/auth/data/services/auth_service.dart';

class AuthRepoImplementation implements AuthRepo {
  final AuthService authService;

  AuthRepoImplementation({required this.authService});

  @override
  Future<Either<Failure, String>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      var user =
          await authService.signIn(email: email, password: password) as User;

      return Right(user.uid);
    } on CustomException catch (e) {
      log("error happend in AuthRepoImplementation in signIn the error : $e");
      return Left(ServerFailure(message: e.exceptionMeassge));
    }
  }

  @override
  Future<Either<Failure, String>> createNewAccount({
    required String email,
    required String password,
  }) async {
    try {
      final user =
          await authService.register(email: email, password: password) as User;

      return Right(user.uid);
    } on CustomException catch (e) {
      log(
        "error happend in AuthRepoImplementation in createNewAccount the error : $e",
      );
      return Left(ServerFailure(message: e.exceptionMeassge));
    }
  }
}
