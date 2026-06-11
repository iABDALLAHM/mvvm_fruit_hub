import 'package:dartz/dartz.dart';
import 'package:mvvm_fruit_hub/core/errors/custom_exception.dart';
import 'package:mvvm_fruit_hub/core/errors/failures.dart';
import 'package:mvvm_fruit_hub/core/errors/server_failure.dart';
import 'package:mvvm_fruit_hub/features/home/data/repositories/products_repositories/products_repository.dart';
import 'package:mvvm_fruit_hub/features/home/data/services/database_service.dart';
import 'package:mvvm_fruit_hub/features/home/domain/models/products/product_model.dart';

class ProductsRepoImple implements ProductsRepo {
  final DatabaseService _databaseService;

  ProductsRepoImple({required DatabaseService databaseService})
    : _databaseService = databaseService;

  @override
  Future<Either<Failure, List<ProductModel>>> getProducts() async {
    try {
      var result = await _databaseService.getData(path: "products");
      List<ProductModel> productsList = [];
      for (var productModel in result) {
        productsList.add(ProductModel.fromJson(productModel));
      }
      return Right(productsList);
    } on CustomException catch (e) {
      return Left(ServerFailure(message: e.exceptionMeassge));
    }
  }
}
