// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_on/services/service.dart';
import 'package:move_on/auth/login/loading_provider.dart';
import 'package:move_on/src/base/api_sevices/errors/result_type.dart';
import 'package:move_on/src/views/base_view.dart';
import 'package:move_on/src/views/error_alert_view.dart';
import 'package:move_on/auth/sign_up/sign_up_view_model.dart';
import 'package:move_on/widgets/botton_widget.dart';
import 'package:move_on/widgets/heading.dart';
import 'package:move_on/widgets/input_textfomfield.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> with BaseView {
  final SignUpViewModel _viewModel;
  _SignUpPageState({SignUpViewModel? viewModel})
      : _viewModel = viewModel ?? DefaultSignUpViewModel();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    _viewModel.initState(
        loadingProvider: Provider.of<LoadingStateProvider>(context));
    return _viewModel.loadingState.isloading
        ? loadingView
        : Scaffold(
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
            body: CustomScrollView(
              slivers: [
                SliverList(
                    delegate: SliverChildListDelegate([
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Form(
                      key: _viewModel.formKey,
                      // autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: SingleChildScrollView(
                        reverse: true,
                        child: Column(children: [
                          const Header(text: 'Create your account'),
                          SizedBox(
                            height: 20.h,
                          ),
                          InputTextFormfield(
                            hintText: 'User Name',
                            textInputType: InputTextType.usernname,
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.yellow.shade900,
                            ),
                            delegate: _viewModel,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Plaese Enter your name';
                              } else {
                                return null;
                              }
                            },
                          ),
                          InputTextFormfield(
                            hintText: 'Email',
                            textInputType: InputTextType.email,
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.cyan.shade400,
                            ),
                            delegate: _viewModel,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your email addres';
                              } else if (value.isValidEmail() == false) {
                                return 'invalid email';
                              } else if (value.isValidEmail() == true) {
                                return null;
                              } else {
                                return null;
                              }
                            },
                          ),
                          InputTextFormfield(
                            hintText: 'Password',
                            textInputType: InputTextType.password,
                            obscureText: _obscureText,
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.red.shade600,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureText == true
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.black45,
                                size: 20,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                            ),
                            delegate: _viewModel,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your password';
                              } else if (value.length < 8) {
                                return 'Passwords longer than 8 characters';
                              } else {
                                return null;
                              }
                            },
                          ),
                          InputTextFormfield(
                            hintText: 'Phone',
                            textInputType: InputTextType.phone,
                            prefixIcon: Icon(
                              Icons.phone,
                              color: Colors.green.shade300,
                            ),
                            delegate: _viewModel,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Plaese Enter your Phone';
                              } else {
                                return null;
                              }
                            },
                          ),
                          GestureDetector(
                            onTap: () => _selectDate(context),
                            child: AbsorbPointer(
                              child: InputTextFormfield(
                                hintText: 'Date of birth',
                                textInputType: InputTextType.dateOfBirth,
                                prefixIcon: const Icon(
                                  Icons.date_range,
                                  color: Colors.indigo,
                                ),
                                delegate: _viewModel,
                                controller: _viewModel.dateController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Plaese Enter date of birth';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 30.h),
                            child: SizedBox(
                              width: width * 0.8,
                              child: BottonWidget(
                                label: 'Sign Up',
                                icon: Icons.upload_rounded,
                                press: () {
                                  _signUP(context);
                                },
                                style:
                                    styles(fontSize: 16, color: Colors.white),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(24),
                            child: const Text(
                                'By clicking Sign up you agree to the following Terms and Conditions without reservation.'),
                          )
                        ]),
                      ),
                    ),
                  ),
                ]))
              ],
            ));
  }

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _viewModel.selectedDate,
        firstDate: DateTime(1900, 1),
        lastDate: DateTime(2500),
        locale: const Locale('en', ''));
    if (picked != null && picked != _viewModel.selectedDate) {
      _viewModel.signUpModel?.date =
          '${picked.toLocal().day}/${picked.toLocal().month}/${picked.toLocal().year}';
      _viewModel.dateController.text =
          '${picked.toLocal().day}/${picked.toLocal().month}/${picked.toLocal().year}';
    }
  }

  _signUP(BuildContext context) {
    if (_viewModel.formKey.currentState!.validate()) {
      _viewModel.signUp().then((value) {
        switch (value.status) {
          case ResultStatus.success:
            Navigator.pushNamed(context, 'home_tab');
          case ResultStatus.error:
            // errorProvider.setFailure(context: context, value: value.error!);
            ErrorAlertView.showErrorAlertDialog(
                context: context,
                subtitle: 'Error This email is already in use.',
                btnAction: () {
                  Navigator.pop(context);
                });
        }
      });
    }
  }
}
