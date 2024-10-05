import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/api/api_manager/api_manager.dart';
import 'package:e_commerce_app/core/api/end_point/end_point.dart';
import 'package:e_commerce_app/data/datasource_contract/brands_data_source.dart';
import 'package:e_commerce_app/data/model/brands_response/BrandsResponse.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BrandsDataSource)
class BrandsDataSourceImp extends BrandsDataSource {
  ApiManager apiManager;

  @FactoryMethod()
  BrandsDataSourceImp({required this.apiManager});

  @override
  Future<Either<BrandsResponse, String>> getBrands() async {
    try {
      var response = await apiManager.getRequest(
          endPoint: EndPoint.brandsEndPoint);
      BrandsResponse brandsResponse =
          BrandsResponse.fromJson(response.data);
      return Left(brandsResponse);
    } catch (error) {
      return Right(error.toString());
    }
  }
}
