import 'package:chatgpt/core/theme/app_colors/app_color_dark.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../cubit/onboarding_cubit.dart';

class CustomSmoothPageIndicator extends StatelessWidget {
  const CustomSmoothPageIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return  SmoothPageIndicator(
      controller: AppOnBoardingCubit.get(context).pageController,
      count:AppOnBoardingCubit.get(context).list.length,
      effect:
      WormEffect(
          dotColor:Theme.of(context).dividerColor.withOpacity(0.20),
          activeDotColor:AppColorDark.primaryColor ,
          dotWidth:28.w,
          dotHeight: 2.h,
      ),
    );
  }
}
