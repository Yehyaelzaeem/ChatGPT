import 'package:chatgpt/core/helper/spacing/spacing.dart';
import 'package:chatgpt/features/chat_gpt/cubit/chat_gpt_cubit.dart';
import 'package:chatgpt/features/chat_gpt/ui/chat.dart';
import 'package:chatgpt/features/chat_gpt/ui/widgets/custom_base_top_item_widget.dart';
import 'package:chatgpt/features/chat_gpt/ui/widgets/custom_setting_home_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit =ChatGptCubit.get(context);
    final isDarkMode = Theme.of(context).brightness;

    return  Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
      body:
      BlocConsumer<ChatGptCubit,ChatGptState>(
        builder: (context,state){
          return Column(
            children: [
              verticalSpace(20),
              CustomBaseTopItemWidget(
                text: 'New Chat',
                iconDataLift: Icons.messenger_outline,
                widgetRight:  Icon( Icons.arrow_forward_ios,
                color: Theme.of(context).dividerColor,
                ),
                isChat: false,
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const ChatScreen()));
                },
              ),
              verticalSpace(12),
              Expanded(
                child:ListView.builder(
                    itemCount: cubit.chatHistoryList.length,
                    itemBuilder: (context,i){
                      return Padding(
                        padding:  EdgeInsets.only(top: 12.h),
                        child: CustomBaseTopItemWidget(
                          text: cubit.chatHistoryList[i].msg,
                          iconDataLift: Icons.messenger_outline,
                          widgetRight:  Icon( Icons.arrow_forward_ios,
                          color: Theme.of(context).dividerColor.withOpacity(0.60),
                          ),
                          isChat: false,
                          isHistory: true,
                          history: cubit.chatHistoryList[i],
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const ChatScreen()));
                          },
                        ),
                      );

                    }),
              ),
              const Divider(),
              const CustomSettingHomeWidget(),
            ],
          );
        },
        listener: (context,state){},
      )
    );
  }
}
