import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/utils/colors/color_manager.dart';
import 'package:e_commerce_app/core/utils/styles/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../domain/entities/BrandEntity.dart';

class BrandWidget extends StatelessWidget {
  BrandEntity brandEntity;

  BrandWidget({super.key, required this.brandEntity});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CachedNetworkImage(
          width: 90.w,
          height: 90.h,
          imageUrl: brandEntity.image ?? '',
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => const Center(
            child: Icon(Icons.error),
          ),
        ),
        Text(
          brandEntity.name ?? '',
          style: getRegularStyle(color: ColorManager.textColor),
        ),
      ],
    );
  }
}
