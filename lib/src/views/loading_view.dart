import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_on/services/service.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(
              backgroundColor: orange,
            ),
            Padding(
              padding: EdgeInsets.only(top: 12.w),
              child: Text(
                'Loading...',
                style: styles(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: orange,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
