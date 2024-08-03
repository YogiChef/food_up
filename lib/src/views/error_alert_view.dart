import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_on/services/service.dart';
import 'package:move_on/widgets/botton_widget.dart';

class ErrorAlertView {
  static Future showErrorAlertDialog(
      {required BuildContext context,
      required String subtitle,
      required dynamic Function()? btnAction}) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image(
                  image: const AssetImage('images/error.webp'),
                  width: 120.w,
                  height: 120.h,
                ),
                Container(
                  margin: const EdgeInsets.all(15),
                  child: Text(
                    'Network error',
                    style: styles(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    bottom: 12.h,
                  ),
                  child: Text(
                    subtitle,
                    textAlign: TextAlign.center,
                    style: styles(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: orange,
                    ),
                  ),
                ),
                BottonWidget(
                  label: 'Enable Location',
                  style: styles(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                  icon: Icons.error_outline,
                  press: btnAction!,
                )
              ],
            ),
          );
        });
  }
}
