import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/CategoryEntitiy.dart';
import 'package:e_commerce_app/domain/repository_contract/categories_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class GetCategoriesUseCases {
  @factoryMethod
  CategoriesRepository categoriesRepository;

  GetCategoriesUseCases({required this.categoriesRepository});

  Future<Either<List<CategoryEntity>, String>> call() {
    return categoriesRepository.getCategories();
  }
}
