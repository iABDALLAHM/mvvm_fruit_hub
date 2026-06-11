import 'package:flutter/material.dart';
import 'package:mvvm_fruit_hub/features/home/presentation/views/widgets/home_view_bloc_provider.dart';
import 'package:mvvm_fruit_hub/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String routeName = "HomeView";
  @override
  Widget build(BuildContext context) {
    return HomeViewBlocProvider(
      child: Scaffold(appBar: AppBar(), body: HomeViewBody()),
    );
  }
}
