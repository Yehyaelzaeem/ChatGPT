import 'package:chatgpt/core/theme/app_colors/app_color_dark.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomEnding extends StatelessWidget {
  const CustomEnding({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColorDark.hardColor,
      ),
      width: 134.w,
      height: 5.h,
    );
  }
}
