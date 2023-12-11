import 'package:chatgpt/core/global/constatnties/app_image_constatnt.dart';
import 'package:chatgpt/features/chat_gpt/cubit/chat_gpt_cubit.dart';
import 'package:chatgpt/features/chat_gpt/ui/widgets/custom_base_top_item_widget.dart';
import 'package:chatgpt/features/chat_gpt/ui/widgets/receive_message_widget.dart';
import 'package:chatgpt/features/chat_gpt/ui/widgets/send_message_widget.dart';
import 'package:chatgpt/features/chat_gpt/ui/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/helper/spacing/spacing.dart';
import '../../../core/widgets/custom_ending.dart';
class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var cubit = ChatGptCubit.get(context);
    final isDarkMode = Theme.of(context).brightness;
    return SafeArea(
      child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: AppBar(
              toolbarHeight: 0.0,
              systemOverlayStyle:  SystemUiOverlayStyle(
                  statusBarColor:  Theme.of(context).scaffoldBackgroundColor,
                  statusBarIconBrightness:
                  isDarkMode==Brightness.light?Brightness.dark:Brightness.light,
                  systemNavigationBarIconBrightness:
                  isDarkMode!=Brightness.light?Brightness.dark:Brightness.light,
                  systemNavigationBarColor:
                  Theme.of(context).scaffoldBackgroundColor,),
              elevation: 0.0),
          body: BlocConsumer<ChatGptCubit, ChatGptState>(
            builder: (context, state) {
              return Column(
                children: [
                  CustomBaseTopItemWidget(
                    text: 'Back',
                    iconDataLift: Icons.arrow_back_ios_rounded,
                    widgetRight: SvgPicture.asset(AppImage.logo,color: Theme.of(context).dividerColor,),
                    width: 375.w,
                    height: 64.h,
                    isChat: true,
                    iconOnTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  Divider(
                    color: Theme.of(context).dividerColor.withOpacity(0.32),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.w, right: 20.w),
                      child:
                      cubit.getChatList.isNotEmpty?
                      ListView.builder(
                        controller: cubit.listScrollController,
                        itemCount: cubit.getChatList.length,
                        itemBuilder: (context, i) {
                          if (cubit.getChatList[i].chatIndex == 0) {
                            return  SendMessageWidget(
                                text: ChatGptCubit.get(context).getChatList[i].msg);
                          } else {
                            return ReceiveMessageWidget(
                              text:
                              ChatGptCubit.get(context).getChatList[i].msg,
                              shouldAnimate: ChatGptCubit.get(context).getChatList.length-1==i,
                              index: i,

                            );
                          }
                        },
                      ):
                      Center(
                        child: Text('Ask anything, get your answer',
                            style:Theme.of(context).textTheme.displaySmall!.copyWith(
                                color: Theme.of(context).dividerColor.withOpacity(0.40)
                            )),
                      ),
                    ),
                  ),
                  if (cubit.isTyping) ...[
                    Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Container(
                        margin: const EdgeInsets.only(left: 20,top: 20,bottom: 20),
                        width: 61.w,
                        height: 43.h,
                        decoration:  BoxDecoration(
                            color: Theme.of(context).dividerColor.withOpacity(0.20),
                            borderRadius: const BorderRadius.only(
                              topLeft:Radius.circular(8) ,
                              topRight: Radius.circular(8) ,
                              bottomRight: Radius.circular(8) ,
                            )
                        ),
                        child:  SpinKitThreeBounce(
                          color: Theme.of(context).dividerColor,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                  verticalSpace(20),
                  TextFieldWidget(
                    onSubmitted: (v) async {
                      await cubit.sendMessageFCT(chatGptCubit: ChatGptCubit.get(context), context: context,);
                    },
                    onTap: () async {
                      await cubit.sendMessageFCT(chatGptCubit: ChatGptCubit.get(context), context: context,);
                    },
                  ),
                  verticalSpace(27),
                  const CustomEnding(),
                ],
              );

            },
            listener: (context, state) {},
          )),
    );
  }
}
