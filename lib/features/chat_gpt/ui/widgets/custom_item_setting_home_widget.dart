import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helper/spacing/spacing.dart';

class CustomItemSettingWidget extends StatelessWidget {
  CustomItemSettingWidget({super.key,required this.iconData,required this.text,required this.onTap, this.textColor, this.notificationText, this.iconColor,});
  final IconData iconData;
  final String text;
  final String? notificationText;
  final Color? textColor;
  final Color? iconColor;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 52.h,
        width: 335.w,
        child: Row(
          children: [
            Icon(iconData,
            color: iconColor??Theme.of(context).dividerColor,
            ),
            horizontalSpace(16),
            Text(text,
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  fontWeight: FontWeight.w500,
                color: textColor ?? Theme.of(context).dividerColor
              ),
            ),
            notificationText !=null ?const Spacer():const SizedBox(width: 0,),
            notificationText !=null ?
            Container(
              decoration: BoxDecoration(
                color:const Color(0xffFBF3AD) ,
                borderRadius: BorderRadius.circular(8)
              ),
              width: 46.w,
              height: 20.h,
              child: Center(
                child: Text(notificationText!,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff887B06)
                  )
                ),
              ),
            ):const SizedBox(width: 0,),
          ],
        ),
      ),
    );
  }

}
