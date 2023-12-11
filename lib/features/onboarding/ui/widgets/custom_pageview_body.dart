import 'package:chatgpt/core/helper/spacing/spacing.dart';
import 'package:flutter/material.dart';
import '../../data/model.dart';
import 'custom_text_onboarding_widget.dart';

class CustomPageViewBody extends StatelessWidget {
  const CustomPageViewBody({super.key, required this.onBoardingModel});
 final OnBoardingModel onBoardingModel;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          children:[
            verticalSpace(38),
            Container(child: onBoardingModel.logoIcon,
            ),
            verticalSpace(24),
            Text(onBoardingModel.title,
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                color: Theme.of(context).dividerColor
              )
            ),
            verticalSpace(24),
            Text(onBoardingModel.subTitle,
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                color: Theme.of(context).dividerColor
            ),
            ),
            verticalSpace(60),
            Container(
              child: onBoardingModel.icon,
            ),
            verticalSpace(12),
            Text(onBoardingModel.text,
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                color: Theme.of(context).dividerColor
            ),
            ),
            verticalSpace(40),
            CustomTextOnBoardingWidget(text: onBoardingModel.textFirstWidget,),
            verticalSpace(16),
            CustomTextOnBoardingWidget(text: onBoardingModel.textSecondWidget,),
            verticalSpace(16),
            CustomTextOnBoardingWidget(text: onBoardingModel.textThirdWidget,),

          ]),
    );
  }
}
