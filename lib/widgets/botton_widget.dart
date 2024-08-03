import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_on/services/service.dart';

class BottonWidget extends StatelessWidget {
  final String label;
  final IconData icon;
  final Function() press;
  final TextStyle? style;
  final Color? color;

  const BottonWidget({
    super.key,
    required this.label,
    required this.icon,
    this.style,
    required this.press,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? orange,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
      label: Text(
        label,
        style: style,
      ),
      onPressed: press,
      icon: Icon(
        icon,
        size: 20,
        color: Colors.white,
      ),
    );
  }
}

class DeliveryBotton extends StatelessWidget {
  final String label;
  final Function() press;
  final TextStyle? style;
  final Color? color;

  const DeliveryBotton({
    super.key,
    required this.label,
    this.style,
    required this.press,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? orange,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      onPressed: press,
      child: Text(
        label,
        style: style,
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {
  final Function()? onPressed;
  final bool isActive;
  final String text;
  const RoundedButton({
    super.key,
    this.onPressed,
    required this.text,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 43.h,
      child: ActionChip(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
          shadowColor: Colors.indigo,
          elevation: isActive ? 4 : 0,
          backgroundColor: isActive ? orange : Colors.transparent,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7),
              side: BorderSide(
                color: isActive ? Colors.white : Colors.blueGrey,
              )),
          onPressed: onPressed,
          labelPadding: EdgeInsets.symmetric(
            horizontal: 8.w,
          ),
          label: Text(
            text,
            style: styles(
              color: isActive ? Colors.white : Colors.blueGrey,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
          )),
    );
  }
}
