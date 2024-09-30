import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/api/api_manager/api_manager.dart';
import 'package:e_commerce_app/core/api/end_point/end_point.dart';
import 'package:e_commerce_app/data/datasource_contract/categories_data_source.dart';
import 'package:e_commerce_app/data/model/category_response/CategoryResponse.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CategoriesDataSource)
class CategoriesDataSourceImp extends CategoriesDataSource {
  ApiManager apiDateSource;

  @factoryMethod
  CategoriesDataSourceImp({required this.apiDateSource});

  @override
  Future<Either<CategoryResponse, String>> getCategories() async {
    try {
      var response = await apiDateSource.getRequest(
          endPoint: EndPoint.categoriesEndPoint);
      CategoryResponse categoryResponse =
          CategoryResponse.fromJson(response.data);
      return Left(categoryResponse);
    } catch (error) {
      return Right(error.toString());
    }
  }
}
