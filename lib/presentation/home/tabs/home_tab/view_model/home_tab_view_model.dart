import 'package:e_commerce_app/domain/entities/CategoryEntitiy.dart';
import 'package:e_commerce_app/domain/usecases/get_categories_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class HomeTabViewModel extends Cubit<HomeTabState> {
  @factoryMethod
  HomeTabViewModel({required this.getCategoriesUseCases})
      : super(HomeTabInitialState());
  GetCategoriesUseCases getCategoriesUseCases;

  void getCategories() async {
    emit(CategoriesLoadingState());
    var response = await getCategoriesUseCases.call();
    response.fold((categoryList) {
      emit(CategoriesSuccessState(categories: categoryList));
    }, (error) {
      emit(CategoriesErrorState(error: error));
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
