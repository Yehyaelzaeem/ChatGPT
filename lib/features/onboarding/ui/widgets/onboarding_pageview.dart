import 'package:flutter/cupertino.dart';
import '../../cubit/onboarding_cubit.dart';
import 'custom_pageview_body.dart';

class OnBoardingPageViewWidget extends StatelessWidget {
  const OnBoardingPageViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: PageView.builder(
          controller: AppOnBoardingCubit.get(context).pageController,
          physics: const BouncingScrollPhysics(),
          onPageChanged: (int index){
            AppOnBoardingCubit.get(context).page=index;
          },
          itemCount: AppOnBoardingCubit.get(context).list.length,
          itemBuilder: (context, i) {
            return CustomPageViewBody(onBoardingModel: AppOnBoardingCubit.get(context).list[i],);
          }),
    );
  }
}
