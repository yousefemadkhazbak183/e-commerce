import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/BrandEntity.dart';

abstract class BrandsRepository {
  Future<Either<List<BrandEntity>, String>> getBrands();
}
