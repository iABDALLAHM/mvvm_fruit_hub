import 'package:dartz/dartz.dart';
import 'package:mvvm_fruit_hub/core/errors/failures.dart';

abstract class AuthRepo {
  Future<Either<Failure, String>> createNewAccount({
    required String email,
    required String password,
  });
  Future<Either<Failure, String>> signIn({
    required String email,
    required String password,
  });
}
