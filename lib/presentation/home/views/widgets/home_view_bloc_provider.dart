import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_fruit_hub/data/services/get_it/get_it_service.dart';
import 'package:mvvm_fruit_hub/data/repositories/products_repositories/products_repository.dart';
import 'package:mvvm_fruit_hub/presentation/home/cubit/get_products_cubit/get_products_cubit.dart';

class HomeViewBlocProvider extends StatelessWidget {
  const HomeViewBlocProvider({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetProductsCubit(productsRepo: getIt.get<ProductsRepository>()),
      child: child,
    );
  }
}
