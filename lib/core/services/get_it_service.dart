import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:mvvm_fruit_hub/features/auth/data/repositories/auth_repo.dart';
import 'package:mvvm_fruit_hub/features/auth/data/repositories/auth_repo_implementation.dart';
import 'package:mvvm_fruit_hub/features/auth/data/services/auth_service.dart';
import 'package:mvvm_fruit_hub/features/auth/data/services/firebase_auth_service.dart';
import 'package:mvvm_fruit_hub/features/home/data/repositories/products_repositories/products_repository.dart';
import 'package:mvvm_fruit_hub/features/home/data/repositories/products_repositories/products_repository_imple.dart';
import 'package:mvvm_fruit_hub/features/home/data/services/database_service.dart';
import 'package:mvvm_fruit_hub/features/home/data/services/firestore_service.dart';

GetIt getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<AuthService>(
    FirebaseAuthService(firebaseAuth: FirebaseAuth.instance),
  );

  getIt.registerSingleton<AuthRepo>(
    AuthRepoImplementation(authService: getIt.get<AuthService>()),
  );

  getIt.registerSingleton<DatabaseService>(
    FirestoreService(fireStore: FirebaseFirestore.instance),
  );

  getIt.registerSingleton<ProductsRepo>(
    ProductsRepoImple(databaseService: getIt.get<DatabaseService>()),
  );
}
