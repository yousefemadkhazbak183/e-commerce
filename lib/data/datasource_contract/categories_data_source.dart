import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/model/category_response/CategoryResponse.dart';

abstract class CategoriesDataSource {
  Future<Either<CategoryResponse, String>> getCategories();
}
