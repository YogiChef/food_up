import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_on/services/service.dart';
import 'package:move_on/src/views/base_view.dart';
import 'package:move_on/widgets/heading.dart';

class ErrorView extends StatelessWidget with BaseView {
  ErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          padding: EdgeInsets.only(top: 45.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                  width: 246.w,
                  height: 246.h,
                  image: const AssetImage('images/dataerror.webp')),
              Container(
                margin: EdgeInsets.only(top: 10.h),
                child: Header(
                  text: 'Netword Error',
                  style: styles(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.red,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10.h),
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Header(
                  text: 'Not Found Data',
                  style: styles(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.red,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ErrorNetwork extends StatelessWidget with BaseView {
  ErrorNetwork({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          padding: EdgeInsets.only(top: 45.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                  width: 146.w,
                  height: 146.h,
                  image: const AssetImage('images/networkerror.webp')),
              Container(
                margin: EdgeInsets.only(top: 30.h),
                child: Header(
                  text: 'Network Error',
                  style: styles(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.red,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.h),
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Header(
                  text: ' Location Permissions are denied.',
                  style: styles(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.red,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
