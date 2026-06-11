import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:mvvm_fruit_hub/data/repositories/auth_repository/auth_repository.dart';
import 'package:mvvm_fruit_hub/data/repositories/auth_repository/auth_repository_implementation.dart';
import 'package:mvvm_fruit_hub/data/services/auth/auth_service.dart';
import 'package:mvvm_fruit_hub/data/services/auth/firebase_auth_service.dart';
import 'package:mvvm_fruit_hub/data/repositories/products_repositories/products_repository.dart';
import 'package:mvvm_fruit_hub/data/repositories/products_repositories/products_repository_implementation.dart';
import 'package:mvvm_fruit_hub/data/services/database/database_service.dart';
import 'package:mvvm_fruit_hub/data/services/database/firestore_service.dart';

GetIt getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<AuthService>(
    FirebaseAuthService(firebaseAuth: FirebaseAuth.instance),
  );

  getIt.registerSingleton<AuthRepository>(
    AuthRepositoryImplementation(authService: getIt.get<AuthService>()),
  );

  getIt.registerSingleton<DatabaseService>(
    FirestoreService(fireStore: FirebaseFirestore.instance),
  );

  getIt.registerSingleton<ProductsRepository>(
    ProductsRepositoryImplementation(
      databaseService: getIt.get<DatabaseService>(),
    ),
  );
}
