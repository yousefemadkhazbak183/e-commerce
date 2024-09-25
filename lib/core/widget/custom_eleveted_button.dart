import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/colors/color_manager.dart';
import '../utils/styles/style_manager.dart';

class CustomElevatedButton extends StatelessWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String label;
  final Color? backgroundColor;
  final double? radius;
  final void Function() onTap;
  final TextStyle? textStyle;
  final bool isStadiumBorder;

  const CustomElevatedButton({
    super.key,
    this.prefixIcon,
    this.suffixIcon,
    required this.label,
    this.backgroundColor,
    this.radius,
    required this.onTap,
    this.textStyle,
    this.isStadiumBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: isStadiumBorder
              ? const StadiumBorder()
              : RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(17.r)),
          backgroundColor: backgroundColor ?? ColorManager.primary,
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 14.h),
        ),
        onPressed: onTap,
        child: Row(
          children: [
            prefixIcon ?? const SizedBox(),
            SizedBox(
              width: 24.w,
            ),
            Text(label,
                style: textStyle ??
                    getMediumStyle(color: ColorManager.white)
                        .copyWith(fontSize: 20.sp)),
            SizedBox(
              width: 27.w,
            ),
            suffixIcon ?? const SizedBox()
          ],
        ));
  }
}
