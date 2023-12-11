import 'package:chatgpt/core/helper/spacing/spacing.dart';
import 'package:chatgpt/core/theme/app_colors/app_color_dark.dart';
import 'package:chatgpt/features/onboarding/ui/widgets/custom_button.dart';
import 'package:chatgpt/core/widgets/custom_ending.dart';
import 'package:chatgpt/features/onboarding/ui/widgets/onboarding_pageview.dart';
import 'package:chatgpt/features/onboarding/ui/widgets/smoothpageindicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../cubit/onboarding_cubit.dart';
import '../cubit/onboarding_states.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness;
    return
      BlocConsumer<AppOnBoardingCubit, AppOnBoardingStates>(
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                  toolbarHeight: 0.0,
                  systemOverlayStyle:  SystemUiOverlayStyle(
                    statusBarColor: Theme.of(context).scaffoldBackgroundColor,
                    statusBarIconBrightness: isDarkMode ==Brightness.dark?Brightness.light:Brightness.dark,
                    systemNavigationBarIconBrightness:isDarkMode ==Brightness.dark?Brightness.light:Brightness.dark,
                    systemNavigationBarColor:Theme.of(context).scaffoldBackgroundColor,
                  ),
                  elevation: 0.0
              ),

              body: Padding(
                  padding:  EdgeInsets.only(left: 20.w,right: 20.w),
                  child: Column(
                    children: [
                      const OnBoardingPageViewWidget(),
                      verticalSpace(60),
                      const CustomSmoothPageIndicator(),
                      verticalSpace(20),
                      CustomButton(
                        text: 'Next',
                        textStyle: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColorDark.hardColor
                        ),
                        onPressed: () {
                          AppOnBoardingCubit.get(context).changingPageView(context);
                        },),
                      verticalSpace(47),
                      const CustomEnding(),
                    ],
                  )));
        },
        listener: (context, state) {},
      );
  }
}
