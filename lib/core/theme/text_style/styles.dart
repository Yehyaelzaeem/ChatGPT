import 'package:chatgpt/core/theme/app_colors/app_color_dark.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles{
  static TextStyle font32White700Weight(context) => TextStyle(
    fontSize: 32.sp,
    fontFamily: 'Raleway',
    fontWeight: FontWeight.w700,
    color: Theme.of(context).dividerColor
  );
  static TextStyle font16White600Weight(context) => TextStyle(
    fontSize: 16.sp,
      fontWeight: FontWeight.w600,
    color: Theme.of(context).dividerColor
  );

  static TextStyle font20White500Weight(context) => TextStyle(
    fontSize: 20.sp,
      fontWeight: FontWeight.w500,
    color:  Theme.of(context).dividerColor
  );
  static TextStyle font16White500Weight(context) => TextStyle(
    fontSize: 16.sp,
      fontWeight: FontWeight.w500,
    color:  Theme.of(context).dividerColor
  );


}