import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/utils/colors/color_manager.dart';
import 'package:e_commerce_app/core/utils/styles/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../domain/entities/CategoryEntitiy.dart';

class CategoreyItemWidget extends StatelessWidget {
  CategoryEntity categoryEntity;

  CategoreyItemWidget({super.key, required this.categoryEntity});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CachedNetworkImage(
          imageUrl: categoryEntity.image ?? "",
          imageBuilder: (context, imageProvider) => CircleAvatar(
            backgroundImage: imageProvider,
            radius: 50.r,
          ),
          placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) =>
              const Icon(Icons.error),
        ),
        Text(
          categoryEntity.name ?? '',
          style:
              getRegularStyle(color: ColorManager.appBarTitleColor),
        )
      ],
    );
  }
}
