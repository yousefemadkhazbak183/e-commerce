import 'package:e_commerce_app/presentation/home/tabs/home_tab/view_model/home_tab_view_model.dart';
import 'package:e_commerce_app/presentation/home/tabs/widget/brand_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandsListWidget extends StatefulWidget {
  const BrandsListWidget({super.key});

  @override
  State<BrandsListWidget> createState() => _BrandsListWidgetState();
}

class _BrandsListWidgetState extends State<BrandsListWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeTabViewModel>().getBrands();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabViewModel, HomeTabState>(
        buildWhen: (previous, current) {
      if (current is BrandsSuccessState ||
          current is BrandsLoadingState ||
          current is BrandsErrorStare) {
        return true;
      }
      return false;
    }, builder: (context, state) {
      if (state is BrandsSuccessState) {
        return SizedBox(
          height: 280.h,
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
            itemBuilder: (context, index) =>
                BrandWidget(brandEntity: state.brands[index]),
            itemCount: state.brands.length,
          ),
        );
      }
      if (state is BrandsLoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is BrandsErrorStare) {
        return Center(
          child: Text(state.errorMessage),
        );
      }
      return Container();
    });
  }
}
