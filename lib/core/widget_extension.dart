import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/*
ScreenUtil Padding
 */
extension WidgetPaddingSp on Widget {
  Widget paddingAllSp(double padding) => Padding(
        padding: EdgeInsets.all(padding.h),
        child: this,
      );

  Widget paddingSymmetricSp({
    double horizontal = 0.0,
    double vertical = 0.0,
  }) =>
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontal.h,
          vertical: vertical.h,
        ),
        child: this,
      );

  Widget paddingOnlySp({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) =>
      Padding(
        padding: EdgeInsets.only(
          top: top.h,
          left: left.h,
          right: right.h,
          bottom: bottom.h,
        ),
        child: this,
      );

  Widget get paddingZero => Padding(
        padding: EdgeInsets.zero,
        child: this,
      );
}
