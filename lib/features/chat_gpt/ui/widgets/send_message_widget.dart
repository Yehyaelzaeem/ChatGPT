import 'package:chatgpt/core/theme/app_colors/app_color_dark.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';

class SendMessageWidget extends StatelessWidget {
  const SendMessageWidget({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return ChatBubble(
      clipper: ChatBubbleClipper5(type: BubbleType.sendBubble),
      alignment: Alignment.topRight,
      margin: const EdgeInsets.only(top: 20),
      backGroundColor: Theme.of(context).primaryColor,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
        ),
        child:  Text(text,
          style:Theme.of(context).textTheme.displaySmall!.copyWith(
            color: AppColorDark.hardColor
          ),
        ),
      ),
    );

  }
}
