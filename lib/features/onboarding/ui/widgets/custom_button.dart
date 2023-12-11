import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
   CustomButton({super.key, this.borderRadius,
     this.horizontalPadding, this.verticalPadding,
     this.buttonWidth, this.buttonHeight,this.textStyle,
     this.backgroundColor, required this.text,required this.onPressed});


  final double? borderRadius;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? buttonWidth;
  final double? buttonHeight;
  final Color? backgroundColor;
  void Function() onPressed;
  final String text;
  TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 8.0)
            )
          ),
          backgroundColor: MaterialStatePropertyAll(
              backgroundColor??Theme.of(context).primaryColor,
          ),
          fixedSize: MaterialStateProperty.all(
            Size(buttonWidth??335.w, buttonHeight ??48.h)
          )
        ),
        child: FittedBox(child: Text(text, style: textStyle,)));
  }
}
