import 'package:flutter/material.dart';

mixin LoadingProvider {
  bool isloading = false;
  void setLoading({required bool isLoading});
}

class LoadingStateProvider extends ChangeNotifier with LoadingProvider {
  @override
  void setLoading({required bool isLoading}) {
    isloading = isLoading;
    notifyListeners();
  }
}
