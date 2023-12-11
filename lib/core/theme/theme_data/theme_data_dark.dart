import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../app_colors/app_color_dark.dart';
import '../text_style/styles.dart';


ThemeData getThemeDataDark(context)=>
  ThemeData(
    appBarTheme: getAppThemeDataDark(context),
    fontFamily: 'Raleway',
    brightness:Brightness.dark,
    scaffoldBackgroundColor: AppColorDark.scaffoldBackgroundColor,
    primaryColor: AppColorDark.primaryColor,
    dividerColor:AppColorDark.hardColor,
    hintColor:AppColorDark.scaffoldSecondBackgroundColor,
    textTheme: getTextTheme(context),
) ;

TextTheme getTextTheme(context) =>
         TextTheme(
           displaySmall:TextStyles.font16White600Weight(context),
           displayMedium:TextStyles.font20White500Weight(context),
           displayLarge: TextStyles.font32White700Weight(context),
           titleSmall: TextStyles.font16White500Weight(context),
    );




AppBarTheme getAppThemeDataDark(context) =>
    const AppBarTheme(
        toolbarHeight: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: AppColorDark.scaffoldSecondBackgroundColor,
            statusBarIconBrightness: Brightness.light,
            systemNavigationBarIconBrightness:Brightness.light,
            systemNavigationBarColor:AppColorDark.scaffoldSecondBackgroundColor
        ),
        elevation: 0.0
);
