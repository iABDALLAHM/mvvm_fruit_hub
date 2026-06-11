import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_fruit_hub/ui/home/cubit/get_products_cubit/get_products_cubit.dart';
import 'package:mvvm_fruit_hub/ui/home/views/widgets/custom_fruit_item.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    context.read<GetProductsCubit>().getAllProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var productsLength = context.watch<GetProductsCubit>().state.productsLength;
    return CustomScrollView(
      slivers: [
        SliverGrid.builder(
          itemCount: productsLength,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 163 / 214,
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) => SizedBox(
            child: CustomFruitItem(
              product: context.read<GetProductsCubit>().state.products[index],
            ),
          ),
        ),
        SliverToBoxAdapter(child: const SizedBox(height: 32)),
      ],
    );
  }
}
