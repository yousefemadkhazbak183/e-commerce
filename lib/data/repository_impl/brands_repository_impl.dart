import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/datasource_contract/brands_data_source.dart';
import 'package:e_commerce_app/data/model/brands_response/BrandModel.dart';
import 'package:e_commerce_app/domain/entities/BrandEntity.dart';
import 'package:e_commerce_app/domain/repository_contract/brands_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BrandsRepository)
class BrandsRepositoryImpl extends BrandsRepository {
  BrandsDataSource brandsDataSource;

  @FactoryMethod()
  BrandsRepositoryImpl({required this.brandsDataSource});

  @override
  Future<Either<List<BrandEntity>, String>> getBrands() async {
    var response = await brandsDataSource.getBrands();
    return response.fold((brandsResponse) {
      List<BrandModel> brandModelList = brandsResponse.data ?? [];
      List<BrandEntity> brandEntityList = brandModelList
          .map((brandModel) => brandModel.toBrandEntity())
          .toList();
      return Left(brandEntityList);
    }, (error) {
      return Right(error.toString());
    });
  }
}
