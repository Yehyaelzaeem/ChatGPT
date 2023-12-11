import 'package:chatgpt/core/global/constatnties/app_image_constatnt.dart';
import 'package:chatgpt/features/chat_gpt/cubit/chat_gpt_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({super.key, this.onSubmitted, this.onTap});
  final void Function(String)? onSubmitted;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height:52.h ,
      width:335.w ,
      child: TextField(
          focusNode: ChatGptCubit.get(context).focusNode,
          onSubmitted: onSubmitted,
          textInputAction:TextInputAction.search,
          controller: ChatGptCubit.get(context).textController,
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 8.w,
              vertical: 16.h,
            ),
            focusedBorder:  OutlineInputBorder(
              borderSide: BorderSide(
                  color:Theme.of(context).dividerColor.withOpacity(0.80) ,
                  width:1
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            enabledBorder:  OutlineInputBorder(
              borderSide: BorderSide(
                  color:Theme.of(context).dividerColor.withOpacity(0.32) ,
                  width:1
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            filled: true,
            fillColor: Theme.of(context).dividerColor.withOpacity(0.10),
           suffixIcon: InkWell(
             onTap:onTap,
             child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: SvgPicture.asset(AppImage.iconSend),
             ),

           )
          ),
          keyboardType: TextInputType.multiline,
          maxLines: null,
          style: Theme.of(context).textTheme.displaySmall!.copyWith(
            color:  Theme.of(context).dividerColor
          )
      ),
    );
  }
}
