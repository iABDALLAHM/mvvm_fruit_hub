import 'package:dartz/dartz.dart';
import 'package:mvvm_fruit_hub/domain/models/errors/custom_exception.dart';
import 'package:mvvm_fruit_hub/domain/models/errors/failures.dart';
import 'package:mvvm_fruit_hub/domain/models/errors/server_failure.dart';
import 'package:mvvm_fruit_hub/data/repositories/products_repositories/products_repository.dart';
import 'package:mvvm_fruit_hub/data/services/database/database_service.dart';
import 'package:mvvm_fruit_hub/domain/models/products/product_model.dart';

class ProductsRepositoryImplementation implements ProductsRepository {
  final DatabaseService _databaseService;

  ProductsRepositoryImplementation({required DatabaseService databaseService})
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
