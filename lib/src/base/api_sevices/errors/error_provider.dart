import 'package:flutter/material.dart';
import 'package:move_on/src/base/api_sevices/errors/api_error.dart';
import 'package:move_on/src/views/error_alert_view.dart';

abstract class ErrorProvider {
  void setFailure({required BuildContext context, required Failure value});
}

class ErrorStateProvider extends ChangeNotifier implements ErrorProvider {
  late Failure _failure;

  @override
  void setFailure({required BuildContext context, required Failure value}) {
    _failure = value;
    showAlert(context: context, message: _failure.toString());
    notifyListeners();
  }

  showAlert({required BuildContext context, required String message}) {
    ErrorAlertView.showErrorAlertDialog(
        context: context,
        subtitle: 'subtitle',
        btnAction: () {
          Navigator.pop(context);
        });
  }
}
