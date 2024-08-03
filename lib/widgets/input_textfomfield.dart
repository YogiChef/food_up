// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:move_on/services/service.dart';

enum InputTextType { email, password, phone, usernname, dateOfBirth }

abstract class TextFormFieldDelegate {
  onChanged({
    required String newValue,
    required InputTextType textInputType,
  });
}

class InputTextFormfield extends StatelessWidget {
  InputTextFormfield({
    super.key,
    required this.textInputType,
    required this.prefixIcon,
    this.suffixIcon,
    required this.hintText,
    required this.validator,
    required this.delegate,
    this.controller,
    this.obscureText = false,
    this.readOnly = false,
  });
  final InputTextType textInputType;
  final TextEditingController? controller;
  final Widget prefixIcon;
  final String hintText;
  final Widget? suffixIcon;
  final String? Function(String?) validator;
  TextFormFieldDelegate delegate;
  final bool obscureText;
  final bool readOnly;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        readOnly: readOnly,
        controller: controller,
        onChanged: (onChanged) => delegate.onChanged(
            newValue: onChanged, textInputType: textInputType),
        validator: validator,
        /*(value){
          switch(textInputType){
            case InputTextType.email:
              return EmailValidate.validatEmail(email: value ?? '');
            case InputTextType.password:
                            return PasswordValidate.validatePassword(password: value ?? '');

            case InputTextType.phone:
              DefaultValidate.validateNotEmpty(value: value ?? '');
            case InputTextType.usernname:
                            DefaultValidate.validateNotEmpty(value: value ?? '');

            case InputTextType.dateOfBirth:
                           DefaultValidate.validateNotEmpty(value: value ?? '');

          }
        }*/
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

// ignore: body_might_complete_normally_nullable
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
    default:
      return TextInputType.datetime;
  }
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^([a-zA-Z0-9]+)([\-\_\.]*)([a-zA-Z0-9]*)([@])([a-zA-Z0-9]{2,})([\.][a-zA-Z0-9]{2,3})$')
        .hasMatch(this);
  }
}
