import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chatgpt/core/theme/app_colors/app_color_dark.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';

class CustomMessageReceiveWidget extends StatelessWidget {
  const CustomMessageReceiveWidget({super.key, required this.text, required this.shouldAnimate});
  final String text;
  final bool shouldAnimate;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness;
    return ChatBubble(
        clipper: ChatBubbleClipper5(type: BubbleType.receiverBubble),
        backGroundColor: isDarkMode==Brightness.dark?AppColorDark.hardColor.withOpacity(0.20):
        Theme.of(context).dividerColor.withOpacity(0.20),
        margin: const EdgeInsets.only(top: 15),
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7,
          ),
          child: shouldAnimate ? DefaultTextStyle(
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                color: Colors.white
            ),
            child: AnimatedTextKit(
                isRepeatingAnimation: false,
                repeatForever: false,
                displayFullTextOnTap: true,
                totalRepeatCount: 1,
                animatedTexts: [
                  TyperAnimatedText(
                    text.trim(),
                  ),
                ]),
          ) : Text(
              text.trim(),
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  color: Colors.white
              )
          ),

        ),
      );

  }
}
