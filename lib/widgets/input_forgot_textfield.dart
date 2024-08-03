// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:move_on/services/service.dart';
import 'package:move_on/auth/passwords/forgot_password_view_model.dart';
import 'package:move_on/widgets/form_validate.dart';

enum InputTextType { email, password, phone, usernname, dateOfBirth }

abstract class TextFormFieldDelegate {
  onChanged({
    required String newValue,
    required InputTextType textInputType,
  });
}

class InputForgotTextFormfield extends StatelessWidget {
  const InputForgotTextFormfield(
      {super.key,
      required this.textInputType,
      required this.prefixIcon,
      this.suffixIcon,
      required this.hintText,
      this.controller,
      this.obscureText = false,
      this.readOnly = false,
      required this.viewModel});
  final ForgotPasswordViewModel viewModel;
  final InputTextType textInputType;
  final TextEditingController? controller;
  final Widget prefixIcon;
  final String hintText;
  final Widget? suffixIcon;
  final bool obscureText;
  final bool readOnly;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        readOnly: readOnly,
        controller: controller,
        onChanged: (value) => viewModel.email = value,
        validator: (value) => EmailValidate.validatEmail(email: value ?? ''),

        obscureText: obscureText,
        //  textInputType == InputTextType.password ? true : false,
        keyboardType: keyboardType(textInputType: textInputType),
        style: textstyles(fontSize: 16),
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          hintText: hintText,
          suffixIcon: suffixIcon,
          labelStyle: textstyles(fontSize: 16, color: Colors.black54),
          hintStyle: textstyles(fontSize: 16, color: Colors.black54),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.yellow.shade900, width: 2)),
          errorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2)),
        ),
      ),
    );
  }
}

TextInputType? keyboardType({required InputTextType textInputType}) {
  switch (textInputType) {
    case InputTextType.email:
      return TextInputType.emailAddress;
    case InputTextType.password:
      return TextInputType.visiblePassword;
    case InputTextType.phone:
      return TextInputType.phone;
    case InputTextType.usernname:
      return TextInputType.text;
    case InputTextType.dateOfBirth:
      return null;
  }
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^([a-zA-Z0-9]+)([\-\_\.]*)([a-zA-Z0-9]*)([@])([a-zA-Z0-9]{2,})([\.][a-zA-Z0-9]{2,3})$')
        .hasMatch(this);
  }
}
