import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mvvm_fruit_hub/domain/models/errors/custom_exception.dart';
import 'package:mvvm_fruit_hub/data/services/auth/auth_service.dart';

class FirebaseAuthService implements AuthService {
  final FirebaseAuth firebaseAuth;
  FirebaseAuthService({required this.firebaseAuth});

  @override
  Future<User> register({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        "error happend in FirebaseAuthService in Register method please check it, the error: $e",
      );
      if (e.code == 'weak-password') {
        throw CustomException(exceptionMeassge: "weak password");
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(exceptionMeassge: "this email is already in use");
      } else if (e.code == 'invalid-email') {
        throw CustomException(
          exceptionMeassge: "email or password was wrong, try again later",
        );
      } else if (e.code == "network-request-failed") {
        throw CustomException(exceptionMeassge: "forget connection");
      } else {
        throw CustomException(
          exceptionMeassge: "something was wrong please try again later",
        );
      }
    } catch (e) {
      log(
        "error happend in FirebaseAuthService in Register method please check it, the error: $e",
      );
      throw CustomException(
        exceptionMeassge: "something was wrong please try again later",
      );
    }
  }

  @override
  Future<User> signIn({required String email, required String password}) async {
    try {
      final credential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        "error happend in FirebaseAuthService in signIn method please check it, the error: $e",
      );
      if (e.code == 'user-not-found') {
        throw CustomException(exceptionMeassge: "this user does not exist");
      } else if (e.code == 'wrong-password') {
        throw CustomException(
          exceptionMeassge: "email or password wrong please try again later",
        );
      } else if (e.code == "network-request-failed") {
        throw CustomException(exceptionMeassge: "internet connection failed");
      } else {
        throw CustomException(
          exceptionMeassge: "something was wrong try again later",
        );
      }
    } catch (e) {
      log(
        "error happend in FirebaseAuthService in signIn method please check it, the error: $e",
      );
      throw CustomException(
        exceptionMeassge: "something was wrong try again later",
      );
    }
  }
}
