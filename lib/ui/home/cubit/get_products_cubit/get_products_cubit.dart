import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_fruit_hub/data/repositories/products_repositories/products_repository.dart';
import 'package:mvvm_fruit_hub/ui/home/cubit/get_products_cubit/get_products_state.dart';

class GetProductsCubit extends Cubit<GetProductsState> {
  GetProductsCubit({required ProductsRepository productsRepo})
    : _productsRepo = productsRepo,
      super(
        GetProductsState(
          isLoading: true,
          productsLength: 0,
          message: "",
          products: [],
        ),
      );
  final ProductsRepository _productsRepo;
  Future<void> getAllProducts() async {
    var result = await _productsRepo.getProducts();

    result.fold(
      (failure) {
        emit(
          GetProductsState(
            products: [],
            isLoading: false,
            productsLength: 0,
            message: failure.message,
          ),
        );
      },
      (listOfProducts) {
        emit(
          GetProductsState(
            products: listOfProducts,
            isLoading: false,
            productsLength: listOfProducts.length,
            message: "",
          ),
        );
      },
    );
  }
}
