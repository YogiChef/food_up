import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_on/services/service.dart';
import 'package:move_on/auth/login/loading_provider.dart';
import 'package:move_on/src/base/api_sevices/errors/result_type.dart';
import 'package:move_on/src/views/error_alert_view.dart';
import 'package:move_on/auth/welcome/welcome_view_model.dart';
import 'package:move_on/widgets/botton_widget.dart';
import 'package:provider/provider.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final WelcomeViewModel viewModel;

  _WelcomePageState({WelcomeViewModel? welcomeViewModel})
      : viewModel = welcomeViewModel ?? DefaultWelcomeViewModel();
  @override
  Widget build(BuildContext context) {
    viewModel.initState(
        loadingProvider: Provider.of<LoadingStateProvider>(context));
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/welcome.jpg'), fit: BoxFit.cover)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
            child: Container(
              color: Colors.black.withOpacity(0.3),
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 50.w),
              child: Text(
                'Delivered fast food to your door'.toUpperCase(),
                style: styles(
                    color: Colors.white70,
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 30.h),
              child: Text(
                'Set exact location to find the right restaurants you.',
                style: styles(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
              ),
              child: SizedBox(
                width: width * 0.7,
                child: BottonWidget(
                  label: 'Log in',
                  icon: Icons.login_rounded,
                  press: () {
                    Navigator.pushNamed(context, 'login');
                  },
                  style: styles(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => _signInWithGoogle(context),
                  child: CircleAvatar(
                    radius: 18.r,
                    backgroundColor: Colors.black,
                    backgroundImage: const AssetImage(
                      'images/google.webp',
                    ),
                  ),
                ),
                SizedBox(
                  width: 18.w,
                ),
                GestureDetector(
                  onTap: () {},
                  child: CircleAvatar(
                    radius: 20.r,
                    backgroundColor: Colors.white,
                    backgroundImage: const AssetImage(
                      'images/facebook.png',
                    ),
                  ),
                ),
              ],
            )
          ],
        )
      ]),
    );
  }
}

// ignore: library_private_types_in_public_api
extension UserActions on _WelcomePageState {
  _signInWithGoogle(BuildContext context) {
    viewModel.loadingState.setLoading(isLoading: true);
    viewModel.signInWithGoogle().then((value) {
      switch (value.status) {
        case ResultStatus.success:
          Navigator.pushNamed(context, 'home_tab');
        case ResultStatus.error:
          viewModel.loadingState.setLoading(isLoading: true);
          if (value.error == null) {
            return;
          }
          ErrorAlertView.showErrorAlertDialog(
              context: context,
              subtitle: 'Sign In with Google is Error.',
              btnAction: () {
                Navigator.pop(context);
              });
      }
    });
  }
}
