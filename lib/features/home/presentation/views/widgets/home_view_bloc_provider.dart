import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_fruit_hub/core/services/get_it_service.dart';
import 'package:mvvm_fruit_hub/features/home/data/repositories/products_repositories/products_repository.dart';
import 'package:mvvm_fruit_hub/features/home/presentation/cubits/get_products_cubit/get_products_cubit.dart';

class HomeViewBlocProvider extends StatelessWidget {
  const HomeViewBlocProvider({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetProductsCubit(productsRepo: getIt.get<ProductsRepo>()),
      child: child,
    );
  }
}
