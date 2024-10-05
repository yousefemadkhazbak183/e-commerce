import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/repository_contract/brands_repository.dart';
import 'package:injectable/injectable.dart';

import '../entities/BrandEntity.dart';

@Injectable()
class GetBrandsUseCases {
  @FactoryMethod()
  BrandsRepository brandsRepository;

  GetBrandsUseCases({required this.brandsRepository});

  Future<Either<List<BrandEntity>, String>> call() =>
      brandsRepository.getBrands();
}
