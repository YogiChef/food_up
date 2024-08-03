import 'package:flutter/material.dart';
import 'package:move_on/src/base/api_sevices/errors/error_provider.dart';
import 'package:move_on/auth/login/loading_provider.dart';
import 'package:move_on/src/views/main_coordinator.dart';
import 'package:move_on/src/views/loading_view.dart';

mixin BaseView {
  final MainCoordinator coordinator = MainCoordinator();
  final Widget loadingView = const LoadingView();
  final ErrorStateProvider errorProvider = ErrorStateProvider();
}

mixin BaseViewModel {
  late LoadingStateProvider loadingState;
  void initState({required LoadingStateProvider loadingProvider});
}
