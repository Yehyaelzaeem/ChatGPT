import 'package:chatgpt/features/chat_gpt/cubit/chat_gpt_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/global/constatnties/app_image_constatnt.dart';
import '../../../../core/helper/spacing/spacing.dart';
import 'custom_message_widget.dart';

class ReceiveMessageWidget extends StatelessWidget {
  const ReceiveMessageWidget({super.key, required this.text, required this.shouldAnimate, required this.index});
  final String text;
  final bool shouldAnimate;
  final int index;

  @override
  Widget build(BuildContext context) {
var cubit = ChatGptCubit.get(context);
    return
      Column(
        children: [
           CustomMessageReceiveWidget(text: text, shouldAnimate: shouldAnimate,),
          Padding(
            padding:  EdgeInsets.only(top: 13.h,left: 5.w),
            child:
            BlocConsumer<ChatGptCubit,ChatGptState>(
              builder: (context,state){
                return Row(
                  children: [
                    InkWell(
                    onTap:(){
                  cubit.addLike(cubit.getChatList[index]);
                },
                child:
                cubit.getChatList[index].isLike==true?
                Image.asset(AppImage.likeImage, width: 19.w, height: 18.w,
                fit: BoxFit.cover,):
                SvgPicture.asset(AppImage.iconLike,color: Theme.of(context).dividerColor,),),
                    horizontalSpace(18),
                    InkWell(
                      onTap:(){
                        cubit.addDisLike(cubit.getChatList[index]);
                      },
                      child: cubit.getChatList[index].isNotLike==true?
                      Image.asset(AppImage.disLikeImage,
                        width: 19.w,
                        height: 18.w,
                        fit: BoxFit.cover,
                      ):
                      SvgPicture.asset(AppImage.iconNotLike,color: Theme.of(context).dividerColor,),
                    ),
                    horizontalSpace(40),
                   InkWell(
                     onTap: (){
                       Clipboard.setData(ClipboardData(text: text));
                     },
                     child: Row(
                       children: [
                         SvgPicture.asset(AppImage.iconCopy,color: Theme.of(context).dividerColor,
                         ),
                         horizontalSpace(10),
                         Text('Copy',
                           style: TextStyle(
                               fontSize: 14,
                               color:  Theme.of(context).dividerColor,
                               fontWeight: FontWeight.w600
                           ),
                         ),
                       ],
                     ),
                   )
                  ],
                );
              },
              listener: (context,state){},
            )
          ),
        ],
      );

  }
}
