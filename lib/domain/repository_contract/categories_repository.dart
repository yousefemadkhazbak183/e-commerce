import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/CategoryEntitiy.dart';

abstract class CategoriesRepository {
  Future<Either<List<CategoryEntity>, String>> getCategories();
}
