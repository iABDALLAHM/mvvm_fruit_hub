import 'package:dartz/dartz.dart';
import 'package:mvvm_fruit_hub/core/errors/failures.dart';
import 'package:mvvm_fruit_hub/features/home/domain/models/products/product_model.dart';

abstract class ProductsRepo {
  Future<Either<Failure, List<ProductModel>>> getProducts();
}
