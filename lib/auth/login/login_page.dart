import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_on/services/service.dart';
import 'package:move_on/auth/login/loading_provider.dart';
import 'package:move_on/src/base/api_sevices/errors/result_type.dart';
import 'package:move_on/src/views/base_view.dart';
import 'package:move_on/src/views/error_alert_view.dart';
import 'package:move_on/auth/login/login_view_model.dart';
import 'package:move_on/widgets/botton_widget.dart';
import 'package:move_on/widgets/heading.dart';
import 'package:move_on/widgets/input_textfomfield.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with BaseView {
  final LoginViewModel _viewModel;
  _LoginPageState({LoginViewModel? viewModel})
      : _viewModel = viewModel ?? DefaultLoginViewModel();
  bool _obscureText = true;
  final bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    _viewModel.initState(
        loadingProvider: Provider.of<LoadingStateProvider>(context));
    return _viewModel.loadingState.isloading
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: CircularProgressIndicator(
                  color: Colors.green,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: Text(
                  'Loading...',
                  style: styles(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              )
            ],
          )
        : Scaffold(
            body: CustomScrollView(
            slivers: [
              SliverList(
                  delegate: SliverChildListDelegate([
                GestureDetector(
                  onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
                  behavior: HitTestBehavior.opaque,
                  child: Form(
                    key: _viewModel.formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        Image(
                          image: const AssetImage(
                            'images/login.jpg',
                          ),
                          height: height * 0.5,
                          fit: BoxFit.cover,
                        ),
                        Transform.translate(
                          offset: const Offset(0.0, -30.0),
                          child: Container(
                            width: width,
                            height: height * 0.6,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30.r)),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: 35.h,
                                  right: 20.w,
                                  left: 20.w,
                                  bottom: 0.h),
                              child: Column(
                                children: [
                                  const Header(text: 'Welcome Back'),
                                  Text(
                                    'Login to you account',
                                    style: styles(
                                        fontSize: 15,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 30.h),
                                    child: InputTextFormfield(
                                        delegate: _viewModel,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Please enter your email addres';
                                          } else {
                                            return null;
                                          }
                                        },
                                        hintText: 'Enter Email',
                                        textInputType: InputTextType.email,
                                        prefixIcon: Icon(
                                          Icons.email,
                                          color: Colors.cyan.shade400,
                                        )),
                                  ),
                                  InputTextFormfield(
                                    hintText: 'Enter Password',
                                    textInputType: InputTextType.password,
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      color: Colors.red.shade600,
                                    ),
                                    obscureText: _obscureText,
                                    delegate: _viewModel,
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _obscureText == true
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        size: 20,
                                        color: Colors.black45,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _obscureText = !_obscureText;
                                        });
                                      },
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter your password';
                                      } else if (value.length < 8) {
                                        return 'Passwords longer than eight characters';
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 20, 20, 0),
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: _isLoading
                                          ? const Center(
                                              child:
                                                  CircularProgressIndicator())
                                          : BottonWidget(
                                              label: 'Login',
                                              style: styles(
                                                fontSize: 16,
                                                color: Colors.white,
                                              ),
                                              icon: Icons.login,
                                              press: () => _login(context),
                                            ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 6.h),
                                    height: 35.h,
                                    child: TextButton(
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, 'forgotpassword');
                                        },
                                        child: Text(
                                          'Forgot Password',
                                          style: styles(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.indigo.shade600),
                                        )),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                      right: 20.w,
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          'Need an account',
                                          style: styles(
                                              fontSize: 14,
                                              color: Colors.indigo.shade600),
                                        ),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pushNamed(
                                                  context, 'signup');
                                            },
                                            child: Text(
                                              'SignUp',
                                              style: styles(
                                                  color: Colors.cyan.shade400,
                                                  letterSpacing: 1,
                                                  fontSize: 16),
                                            ))
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ]))
            ],
          ));
  }

  void _login(BuildContext context) {
    if (_viewModel.formKey.currentState!.validate()) {
      _viewModel
          .login(
              email: _viewModel.loginModel?.email ?? '',
              password: _viewModel.loginModel?.password ?? '')
          .then((result) {
        switch (result.status) {
          case ResultStatus.success:
            Navigator.pushNamed(context, 'home_tab');
          case ResultStatus.error:
            if (result.error != null) {
              // errorProvider.setFailure(context: context, value: result.error!);
              ErrorAlertView.showErrorAlertDialog(
                  context: context,
                  subtitle: 'Check your email or password is incorrect.',
                  btnAction: () {
                    Navigator.pop(context);
                  });
            }
        }
      });
    }
  }
}

extension UserAction on LoginPage {}
