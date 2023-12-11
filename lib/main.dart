import 'package:chatgpt/core/theme/theme_data/theme_data_light.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 import 'core/helper/shared_preference/shared_preference.dart';
import 'core/theme/theme_data/theme_data_dark.dart';
import 'features/chat_gpt/cubit/chat_gpt_cubit.dart';
import 'features/chat_gpt/ui/home.dart';
import 'features/onboarding/cubit/onboarding_cubit.dart';
import 'features/onboarding/ui/onboarding_screen.dart';


void main() async{
   WidgetsFlutterBinding.ensureInitialized();
   // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top]);
   await CacheHelper.init();
   var onBoarding = await CacheHelper.getDate(key: 'onBoarding');
   Widget widget;
   if(onBoarding !=null){
      widget=const Home();
   }else{
     widget=const OnBoardingScreen();

   }
   var isDark = await CacheHelper.getDate(key: 'isDark');
   print(isDark.toString());
   runApp( MyApp(widget: widget, isDark: isDark??true,));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.widget, required this.isDark});
  final Widget widget;
  final bool isDark;

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppOnBoardingCubit(context)),
        BlocProvider(create: (context) => ChatGptCubit()..changeMode(isDark)),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_ , child) {
          return  BlocConsumer<ChatGptCubit,ChatGptState>(
              builder: (context,state){
                return  MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Chat GPT',
                  themeMode:ChatGptCubit.get(context).isDark?ThemeMode.dark:ThemeMode.light,
                  darkTheme: getThemeDataDark(context),
                  theme:getThemeDataLight(context),
                  home: widget,
                );
              },
              listener: (context,state){});
        },
      ),
    );
  }
}
