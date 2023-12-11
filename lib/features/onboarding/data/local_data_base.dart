import 'package:chatgpt/core/global/constatnties/app_image_constatnt.dart';
import 'package:chatgpt/core/global/constatnties/app_string_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'model.dart';


class OnBoardingDataBase{
   static  List<OnBoardingModel> onBoardingList(context) =>[
     OnBoardingModel(
         logoIcon: SvgPicture.asset(AppImage.logo,color: Theme.of(context).dividerColor,),
         title: AppStrings.onBoardingTitle,
         subTitle: AppStrings.onBoardingSubTitle,
         icon: SvgPicture.asset(AppImage.iconLight,color: Theme.of(context).dividerColor,),
         text: 'Examples',
         textFirstWidget: '“Explain quantum computing in\n simple terms”',
         textSecondWidget: '“Got any creative ideas for a 10\n year old’s birthday?”',
         textThirdWidget: '“How do I make an HTTP request\n in Javascript?”',),
      OnBoardingModel(
         logoIcon: SvgPicture.asset(AppImage.logo,color: Theme.of(context).dividerColor,),
         title: AppStrings.onBoardingTitle,
         subTitle: AppStrings.onBoardingSubTitle,
         icon: SvgPicture.asset(AppImage.iconBolt,color: Theme.of(context).dividerColor,),
         text: 'Capabilities',
         textFirstWidget: 'Remembers what user said earlier in the conversation',
         textSecondWidget: 'Allows user to provide follow-up corrections',
         textThirdWidget: 'Trained to decline inappropriate requests',),
      OnBoardingModel(
         logoIcon: SvgPicture.asset(AppImage.logo,color: Theme.of(context).dividerColor,),
         title: AppStrings.onBoardingTitle,
         subTitle: AppStrings.onBoardingSubTitle,
         icon: SvgPicture.asset(AppImage.iconInfo,color: Theme.of(context).dividerColor,),
         text: 'Limitations',
         textFirstWidget: 'May occasionally generate incorrect information',
         textSecondWidget: 'May occasionally produce harmful instructions or biased content',
         textThirdWidget: 'Limited knowledge of world and events after 2021',),


    ];

}