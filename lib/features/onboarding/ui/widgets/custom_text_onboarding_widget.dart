import 'package:chatgpt/core/theme/app_colors/app_color_dark.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextOnBoardingWidget extends StatelessWidget {
  const CustomTextOnBoardingWidget({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 62.h,
        width: 335.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color:  Theme.of(context).dividerColor.withOpacity(0.08),
        ),
        child: Center(
            child:
             Text(text,
                textAlign:TextAlign.center,
                style:Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).dividerColor
                ),
              ),
        ),
    );
  }
}
