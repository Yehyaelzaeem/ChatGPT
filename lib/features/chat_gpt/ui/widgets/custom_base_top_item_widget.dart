import 'package:chatgpt/features/chat_gpt/cubit/chat_gpt_cubit.dart';
import 'package:chatgpt/features/chat_gpt/ui/chat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helper/spacing/spacing.dart';
import '../../data/models/chat_model.dart';

class CustomBaseTopItemWidget extends StatelessWidget {
  const CustomBaseTopItemWidget({super.key, required this.text,
    required this.iconDataLift, required this.widgetRight,this.height,
    this.width,this.isChat,this.onTap,this.iconOnTap, this.isHistory, this.history});
  final String text;
  final IconData iconDataLift;
  final Widget widgetRight;
  final double? height;
  final double? width;
  final bool? isChat;
  final bool? isHistory;
  final void Function()? onTap;
  final void Function()? iconOnTap;
  final ChatModel? history;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness;
    return  Center(
      child:
      InkWell(
        onTap: isChat==true?null:onTap,
        child: SizedBox(
          height:height?? 60.h,
          width:width?? 335.w,
          child:  Padding(
            padding:  EdgeInsets.only(left:  isChat==true?20.w:0,right:  isChat==true?20.w:0),
            child:
            Column(
              children: [
                Row(
                  children: [
                   InkWell(
                     onTap: isChat==true?iconOnTap:null,
                     child: SizedBox(
                       height:height??52.h ,
                       child: Row(
                         children: [
                           Icon(iconDataLift,
                           color:
                           isDarkMode==Brightness.dark?
                           isHistory ==true? Colors.white.withOpacity(0.60):Colors.white:
                           isHistory ==true? Theme.of(context).dividerColor.withOpacity(0.60): Theme.of(context).dividerColor
                           ),
                           horizontalSpace(16),
                           SizedBox(
                             width: 220.w,
                             child: Text(text,
                                 style: Theme.of(context).textTheme.displaySmall!.copyWith(
                                    color: isHistory ==true? Theme.of(context).dividerColor.withOpacity(0.60):Theme.of(context).dividerColor
                                 ),
                               overflow: TextOverflow.ellipsis,
                             ),
                           ),
                         ],
                       ),
                     ),
                   ),
                    const Spacer(),
                     isHistory ==true?
                     PopupMenuButton<int>(
                       onSelected: (value){
                         if(value==1){
                           Navigator.push(context, MaterialPageRoute(builder: (context)=>const ChatScreen()));
                         }else if(value==2)
                         {
                           ChatGptCubit.get(context).deleteHistoryItem(history!);
                         }
                       },
                       itemBuilder: (context) => [
                         const PopupMenuItem(
                           value: 1,
                           child: Row(
                             children: [
                               Icon(Icons.mode_edit_outline_outlined),
                               SizedBox(
                                 width: 10,
                               ),
                               Text("Edit")
                             ],
                           ),
                         ),
                         const PopupMenuItem(
                           value: 2,
                           child: Row(
                             children: [
                               Icon(CupertinoIcons.delete_simple,
                                   color: Color(0xffED8C8C)
                               ),
                               SizedBox(
                                 width: 10,
                               ),
                               Text("Delete",
                                 style: TextStyle(
                                     color: Color(0xffED8C8C)
                                 ),)
                             ],
                           ),
                         ),
                       ],
                       offset: const Offset(-35, 50),
                       color: const Color(0xff343541),
                       elevation: 2,
                     )
                         :const SizedBox.shrink(),
                    horizontalSpace(5),
                    widgetRight,
                  ],
                ),
                isChat==false? const Expanded(child: Divider()):const SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
