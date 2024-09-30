import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/core/di/di.dart';
import 'package:e_commerce_app/core/utils/assets/assets_manager.dart';
import 'package:e_commerce_app/core/utils/strings/strings_manager.dart';
import 'package:e_commerce_app/presentation/home/tabs/home_tab/view_model/home_tab_view_model.dart';
import 'package:e_commerce_app/presentation/home/tabs/widget/categories_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTab extends StatelessWidget {
  HomeTab({super.key});

  List<String> ads = [
    ImageAssets.carousel1,
    ImageAssets.carousel2,
    ImageAssets.carousel3
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeTabViewModel>(),
      child: SingleChildScrollView(
        child: Padding(
          padding: REdgeInsets.all(8.0),
          child: Column(
            children: [
              CarouselSlider.builder(
                options: CarouselOptions(
                  height: 200.h,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration:
                      const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  onPageChanged: (index, reason) {},
                  scrollDirection: Axis.horizontal,
                ),
                itemCount: ads.length,
                itemBuilder: (BuildContext context, int itemIndex,
                        int pageViewIndex) =>
                    Image.asset(ads[itemIndex]),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(StringsManager.categoryTitle),
                  Text(StringsManager.viewAll),
                ],
              ),
              const CategoriesListWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
