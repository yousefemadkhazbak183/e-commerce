import 'package:e_commerce_app/domain/entities/CategoryEntitiy.dart';
import 'package:e_commerce_app/domain/usecases/get_brands_usecases.dart';
import 'package:e_commerce_app/domain/usecases/get_categories_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../domain/entities/BrandEntity.dart';

@Injectable()
class HomeTabViewModel extends Cubit<HomeTabState> {
  @factoryMethod
  HomeTabViewModel(
      {required this.getCategoriesUseCases,
      required this.getBrandsUseCases})
      : super(HomeTabInitialState());
  GetCategoriesUseCases getCategoriesUseCases;
  GetBrandsUseCases getBrandsUseCases;
  void getCategories() async {
    emit(CategoriesLoadingState());
    var response = await getCategoriesUseCases.call();
    response.fold((categoryList) {
      emit(CategoriesSuccessState(categories: categoryList));
    }, (error) {
      emit(CategoriesErrorState(error: error));
    });
  }

  void getBrands() async {
    emit(BrandsLoadingState());
    var result = await getBrandsUseCases.call();
    result.fold((brands) {
      emit(BrandsSuccessState(brands: brands));
    }, (error) {
      emit(BrandsErrorStare(errorMessage: error));
    });
  }
}

sealed class HomeTabState {}

class HomeTabInitialState extends HomeTabState {}

class CategoriesLoadingState extends HomeTabState {}

class CategoriesErrorState extends HomeTabState {
  String error;

  CategoriesErrorState({required this.error});
}

class CategoriesSuccessState extends HomeTabState {
  List<CategoryEntity> categories;

  CategoriesSuccessState({required this.categories});
}

class BrandsLoadingState extends HomeTabState {
  String? LoadingMessage;

  BrandsLoadingState({this.LoadingMessage});
}

class BrandsErrorStare extends HomeTabState {
  String errorMessage;

  BrandsErrorStare({required this.errorMessage});
}

class BrandsSuccessState extends HomeTabState {
  List<BrandEntity> brands;

  BrandsSuccessState({required this.brands});
}
