import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/datasource_contract/categories_data_source.dart';
import 'package:e_commerce_app/data/model/category_response/CategoryModel.dart';
import 'package:e_commerce_app/domain/entities/CategoryEntitiy.dart';
import 'package:e_commerce_app/domain/repository_contract/categories_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CategoriesRepository)
class CategoriesRepositoryImpl extends CategoriesRepository {
  CategoriesDataSource categoriesDataSource;

  @factoryMethod
  CategoriesRepositoryImpl({required this.categoriesDataSource});

  @override
  Future<Either<List<CategoryEntity>, String>> getCategories() async {
    var response = await categoriesDataSource.getCategories();
    return response.fold((categoryResponse) {
      List<CategoryModel> categoryModelList =
          categoryResponse.data ?? [];
      List<CategoryEntity> categoryEntityList = categoryModelList
          .map((categoryModel) => categoryModel.toCategoryEntity())
          .toList();
      return Left(categoryEntityList);
    }, (error) {
      return Right(error.toString());
    });
  }
}
