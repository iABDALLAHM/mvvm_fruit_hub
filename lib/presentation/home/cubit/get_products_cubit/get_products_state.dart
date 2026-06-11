import 'package:mvvm_fruit_hub/domain/models/products/product_model.dart';

final class GetProductsState {
  GetProductsState({required this.productsLength, required this.isLoading, required this.message, required this.products});

  final int productsLength;
  final bool isLoading;
  final String message;
  final List<ProductModel> products;
}
