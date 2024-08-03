import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_on/services/service.dart';
import 'package:move_on/auth/passwords/forgot_password_view_model.dart';
import 'package:move_on/widgets/botton_widget.dart';
import 'package:move_on/widgets/dialog.dart';
import 'package:move_on/widgets/heading.dart';
import 'package:move_on/widgets/input_forgot_textfield.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final ForgotPasswordViewModel _viewModel;

  _ForgotPasswordState({ForgotPasswordViewModel? viewModel})
      : _viewModel = viewModel ?? DefaultForgotPasswordViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 20.r),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              const Header(text: 'Forgot password'),
              Text(
                'Please enter your email address. You will receive a link to create a new password via email.',
                textAlign: TextAlign.center,
                style: styles(fontSize: 15, fontWeight: FontWeight.w400),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 30.h),
                  child: InputForgotTextFormfield(
                    textInputType: InputTextType.email,
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Colors.grey,
                    ),
                    hintText: 'Forget Password',
                    viewModel: _viewModel,
                  )),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
                child: SizedBox(
                  width: width * 0.8,
                  child: BottonWidget(
                    label: 'Send',
                    icon: Icons.send,
                    press: () {
                      _viewModel.updatePassword().then((value) {
                        SendDialog.showMyDialog(
                            contant:
                                'You\'ll shortly receive an email with a code to setup a new password. ',
                            context: context,
                            img: const AssetImage('images/lock.png'),
                            text: 'Done',
                            tabYes: () async {
                              Navigator.pushNamed(context, 'login');
                              await Future.delayed(
                                  const Duration(microseconds: 100));
                            },
                            title: 'Your password has been reset');
                      });
                    },
                    style: styles(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
