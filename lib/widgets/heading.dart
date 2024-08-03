import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_on/services/service.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.text,
    this.style,
    this.textAlign,
  });

  final String text;
  final dynamic style;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: textAlign,
        style: style ?? styles(fontSize: 30.sp, fontWeight: FontWeight.w700));
  }
}

class TitleText extends StatelessWidget {
  const TitleText({
    super.key,
    required this.text,
    required this.title,
    this.onPress,
    this.icon = Icons.play_arrow,
    this.color = Colors.grey,
    this.style,
  });

  final String text;
  final String title;
  final Function()? onPress;
  final IconData icon;
  final Color color;
  final dynamic style;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.only(top: 12.h),
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            Text(
              text,
              style: styles(fontSize: 22.sp, fontWeight: FontWeight.w700),
            ),
            const Spacer(),
            Row(
              children: [
                Text(
                  title,
                  style: style ??
                      styles(fontSize: 14.sp, fontWeight: FontWeight.w700),
                ),
                Icon(
                  icon,
                  size: 20.r,
                  color: color,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
