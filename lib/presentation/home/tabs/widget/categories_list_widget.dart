import 'package:e_commerce_app/core/widget/dialog_utils.dart';
import 'package:e_commerce_app/presentation/home/tabs/home_tab/view_model/home_tab_view_model.dart';
import 'package:e_commerce_app/presentation/home/tabs/widget/categorey_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesListWidget extends StatefulWidget {
  const CategoriesListWidget({super.key});

  @override
  State<CategoriesListWidget> createState() =>
      _CategoriesListWidgetState();
}

class _CategoriesListWidgetState extends State<CategoriesListWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    HomeTabViewModel viewModel = BlocProvider.of(context);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      viewModel.getCategories();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeTabViewModel, HomeTabState>(
        buildWhen: (previous, currentState) {
      if (currentState is CategoriesErrorState) {
        return false;
      }
      if (currentState is CategoriesLoadingState) {
        return false;
      }
      return true;
    }, listenWhen: (previous, currentState) {
      if (currentState is CategoriesErrorState) {
        return true;
      }
      if (currentState is CategoriesLoadingState) {
        return true;
      }
      if (currentState is CategoriesSuccessState) {
        return true;
      }
      return false;
    }, builder: (context, state) {
      if (state is CategoriesSuccessState) {
        return SizedBox(
          height: 288.h,
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
            itemBuilder: (context, index) => CategoreyItemWidget(
              categoryEntity: state.categories[index],
            ),
            itemCount: state.categories.length,
          ),
        );
      }
      return Container();
    }, listener: (context, state) {
      if (state is CategoriesLoadingState) {
        showDialog(
            context: context,
            builder: (context) => const AlertDialog(
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Center(
                        child: CircularProgressIndicator(),
                      ),
                    ],
                  ),
                ));
      }
      if (state is CategoriesErrorState) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  content: Center(child: Text(state.error)),
                ));
      }
      if (state is CategoriesSuccessState) {
        DialogUtils.hideLoading(context);
      }
    });
  }
}
