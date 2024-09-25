import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/core/utils/assets/assets_manager.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  HomeTab({super.key});

  List<String> ads = [
    ImageAssets.carousel1,
    ImageAssets.carousel2,
    ImageAssets.carousel3
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CarouselSlider.builder(
            options: CarouselOptions(
              height: 400,
              aspectRatio: 16 / 9,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              onPageChanged: (index, reason) {},
              scrollDirection: Axis.horizontal,
            ),
            itemCount: ads.length,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) =>
                    Image.asset(ads[itemIndex]),
          )
        ],
      ),
    );
  }
}
