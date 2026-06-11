import 'package:dartz/dartz.dart';
import 'package:mvvm_fruit_hub/domain/models/errors/failures.dart';
import 'package:mvvm_fruit_hub/domain/models/products/product_model.dart';

abstract class ProductsRepository {
  Future<Either<Failure, List<ProductModel>>> getProducts();
}
