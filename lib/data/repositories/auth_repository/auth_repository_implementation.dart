import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mvvm_fruit_hub/domain/models/errors/custom_exception.dart';
import 'package:mvvm_fruit_hub/domain/models/errors/failures.dart';
import 'package:mvvm_fruit_hub/domain/models/errors/server_failure.dart';
import 'package:mvvm_fruit_hub/data/repositories/auth_repository/auth_repository.dart';
import 'package:mvvm_fruit_hub/data/services/auth/auth_service.dart';

class AuthRepositoryImplementation implements AuthRepository {
  final AuthService authService;

  AuthRepositoryImplementation({required this.authService});

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
