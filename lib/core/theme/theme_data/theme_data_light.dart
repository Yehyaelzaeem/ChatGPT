import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../app_colors/app_color_light.dart';
import '../text_style/styles.dart';

ThemeData getThemeDataLight(context)=>
    ThemeData(
        brightness:Brightness.light,
        scaffoldBackgroundColor: AppColorLight.scaffoldBackgroundColor,
        primaryColor: AppColorLight.primaryColor,
        dividerColor:AppColorLight.hardColor,
        appBarTheme: getAppThemeDataDark(),
        textTheme: getTextTheme(context),
        hintColor:AppColorLight.scaffoldSecondBackgroundColor,

    ) ;

TextTheme getTextTheme(context) =>
    TextTheme(
      displaySmall:TextStyles.font16White600Weight(context),
      displayMedium:TextStyles.font20White500Weight(context),
      displayLarge: TextStyles.font32White700Weight(context),
      titleSmall: TextStyles.font16White500Weight(context),
    );




// AppBarTheme
AppBarTheme getAppThemeDataDark() =>
    const AppBarTheme(
        backgroundColor:Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarColor:Color(0xffEABE67),
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Color(0xffEABE67),
        ),
        titleTextStyle: TextStyle(
            color:  Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold
        ),
        iconTheme: IconThemeData(
            color: Colors.black
        ),
        elevation: 0
    );