import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_fruit_hub/data/services/get_it/get_it_service.dart';
import 'package:mvvm_fruit_hub/ui/auth/login/views/login_view.dart';
import 'package:mvvm_fruit_hub/ui/auth/register/views/register_view.dart';
import 'package:mvvm_fruit_hub/ui/home/views/home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupGetIt();
  runApp(const FruitHub());
}

class FruitHub extends StatelessWidget {
  const FruitHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        RegisterView.routeName: (context) => RegisterView(),
        HomeView.routeName: (context) => HomeView(),
      },
      debugShowCheckedModeBanner: false,
      home: LoginView(),
    );
  }
}
