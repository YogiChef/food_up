import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_on/services/service.dart';

class MyAlertDialog {
  static void showMyDialog({
    required BuildContext context,
    required ImageProvider<Object> img,
    required String title,
    required String contant,
    required Function() tabNo,
    required Function() tabYes,
  }) {
    showCupertinoDialog<void>(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
              title: Column(children: [
                Image(
                  image: img,
                  width: 120,
                  height: 100,
                ),
                Text(title),
              ]),
              content: Text(contant),
              actions: <CupertinoDialogAction>[
                CupertinoDialogAction(
                  onPressed: tabNo,
                  child: const Text(
                    'No',
                    style: TextStyle(color: Colors.green),
                  ),
                ),
                CupertinoDialogAction(
                    onPressed: tabYes,
                    child:
                        const Text('Yes', style: TextStyle(color: Colors.red)))
              ],
            ));
  }
}

class SendDialog {
  static void showMyDialog({
    required BuildContext context,
    required ImageProvider<Object> img,
    required String title,
    required String contant,
    required String text,
    required Function() tabYes,
  }) {
    showCupertinoDialog<void>(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
              title: Column(children: [
                Image(
                  image: img,
                  width: 110,
                  height: 110,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30.h, bottom: 12.h),
                  child: Text(
                    title,
                    style: styles(fontSize: 24),
                  ),
                ),
              ]),
              content: Text(
                contant,
                style: textstyles(fontSize: 14, color: Colors.black54),
              ),
              actions: <CupertinoDialogAction>[
                CupertinoDialogAction(
                    onPressed: tabYes,
                    child:
                        Text(text, style: const TextStyle(color: Colors.red)))
              ],
            ));
  }
}

class LoginDialog {
  static void showLoginDialog(BuildContext context) {
    showCupertinoDialog<void>(
        context: context,
        builder: (context) => CupertinoAlertDialog(
              title: const Text('please log in'),
              content: const Text('you should be logged in to take an action'),
              actions: <CupertinoDialogAction>[
                CupertinoDialogAction(
                  child: const Text('Cancel'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                CupertinoDialogAction(
                  child: Text(
                    'Log in',
                    style: styles(
                      color: Colors.red,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, 'customer_login');
                  },
                )
              ],
            ));
  }
}
