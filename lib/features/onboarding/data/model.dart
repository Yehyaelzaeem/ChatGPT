import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class OnBoardingModel{
   final SvgPicture logoIcon;
   final String title;
   final String subTitle;
   final SvgPicture icon;
   final String text;
   final String textFirstWidget;
   final String textSecondWidget;
   final String textThirdWidget;

   OnBoardingModel(
   {
     required this.logoIcon,
     required this.title,
     required this.subTitle,
     required this.icon,
     required this.text,
     required this.textFirstWidget,
     required this.textSecondWidget,
     required this.textThirdWidget
   });
}