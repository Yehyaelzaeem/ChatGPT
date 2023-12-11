import 'package:chatgpt/core/helper/spacing/spacing.dart';
import 'package:chatgpt/core/theme/app_colors/app_color_dark.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/custom_ending.dart';
import '../../cubit/chat_gpt_cubit.dart';
import 'custom_item_setting_home_widget.dart';

class CustomSettingHomeWidget extends StatelessWidget {
  const CustomSettingHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness;
    return Padding(
      padding:  EdgeInsets.only(left: 20.w,right: 20.w,),
      child: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height*0.4,
          child: SingleChildScrollView(
            child: Column(
              children: [
                verticalSpace(12),
                CustomItemSettingWidget(
                  iconData: CupertinoIcons.delete,
                  text: 'Clear conversations',
                  onTap: () {
                    ChatGptCubit.get(context).deleteHistory();
                  },),
                verticalSpace(8),
                CustomItemSettingWidget(
                  iconData: Icons.person_outlined,
                  text: 'Upgrade to Plus',
                  notificationText: 'New',
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Upgrade to Plus Not Available  Now',
                          style: TextStyle(
                              color: Colors.white
                          ),
                        ),
                          backgroundColor: AppColorDark.scaffoldBackgroundColor,
                        ));
                  },),
                verticalSpace(8),
                StatefulBuilder(builder: (context,setState){
                  return CustomItemSettingWidget(
                    iconData:isDarkMode==Brightness.dark?
                  Icons.light_mode_outlined:Icons.light_mode,
                    text: 'Light mode',
                    onTap: () {
                      setState((){
                        var x =!ChatGptCubit.get(context).isDark;
                        ChatGptCubit.get(context).changeMode(x);
                      });
                      },);
                }),
                verticalSpace(8),
                CustomItemSettingWidget(
                  iconData: Icons.open_in_new,
                  text: 'Updates & FAQ',
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                         const SnackBar(content: Text('Not Found Any Updates Now',
                         style: TextStyle(color: Colors.white),),
                        backgroundColor: AppColorDark.scaffoldBackgroundColor,));
                  },),
                verticalSpace(8),
                CustomItemSettingWidget(
                  iconData: Icons.logout,
                  text: 'Logout',
                  textColor: AppColorDark.logOutTextColor,
                  iconColor: AppColorDark.logOutTextColor,
                  onTap: () {
                    ChatGptCubit.get(context).logOut(context);
                  },),
                verticalSpace(12),
                const CustomEnding(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
