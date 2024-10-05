// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/datasource_contract/brands_data_source.dart'
    as _i197;
import '../../data/datasource_contract/categories_data_source.dart'
    as _i672;
import '../../data/datasource_imp/brands_data_source_imp.dart'
    as _i537;
import '../../data/datasource_imp/categories_data_source_imp.dart'
    as _i986;
import '../../data/repository_impl/brands_repository_impl.dart'
    as _i902;
import '../../data/repository_impl/categories_repository_impl.dart'
    as _i687;
import '../../domain/repository_contract/brands_repository.dart'
    as _i81;
import '../../domain/repository_contract/categories_repository.dart'
    as _i520;
import '../../domain/usecases/get_brands_usecases.dart' as _i602;
import '../../domain/usecases/get_categories_usecase.dart' as _i943;
import '../../presentation/home/tabs/home_tab/view_model/home_tab_view_model.dart'
    as _i883;
import '../api/api_manager/api_manager.dart' as _i680;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i680.ApiManager>(() => _i680.ApiManager());
    gh.factory<_i672.CategoriesDataSource>(() =>
        _i986.CategoriesDataSourceImp(
            apiDateSource: gh<_i680.ApiManager>()));
    gh.factory<_i197.BrandsDataSource>(() =>
        _i537.BrandsDataSourceImp(
            apiManager: gh<_i680.ApiManager>()));
    gh.factory<_i81.BrandsRepository>(() =>
        _i902.BrandsRepositoryImpl(
            brandsDataSource: gh<_i197.BrandsDataSource>()));
    gh.factory<_i520.CategoriesRepository>(() =>
        _i687.CategoriesRepositoryImpl(
            categoriesDataSource: gh<_i672.CategoriesDataSource>()));
    gh.factory<_i943.GetCategoriesUseCases>(() =>
        _i943.GetCategoriesUseCases(
            categoriesRepository: gh<_i520.CategoriesRepository>()));
    gh.factory<_i602.GetBrandsUseCases>(() => _i602.GetBrandsUseCases(
        brandsRepository: gh<_i81.BrandsRepository>()));
    gh.factory<_i883.HomeTabViewModel>(() => _i883.HomeTabViewModel(
          getCategoriesUseCases: gh<_i943.GetCategoriesUseCases>(),
          getBrandsUseCases: gh<_i602.GetBrandsUseCases>(),
        ));
    return this;
  }
}
