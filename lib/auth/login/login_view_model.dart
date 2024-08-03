import 'package:flutter/material.dart';
import 'package:move_on/auth/login/login_model.dart';
import 'package:move_on/services/local_key.dart';
import 'package:move_on/src/base/api_sevices/errors/api_error.dart';
import 'package:move_on/auth/login/loading_provider.dart';
import 'package:move_on/src/base/api_sevices/errors/result_type.dart';
import 'package:move_on/src/base/localstores/local_storage_usecase_parameters.dart';
import 'package:move_on/src/base/localstores/save_local_storage_usecase.dart';
import 'package:move_on/auth/login/sign_in_usecase.dart';
import 'package:move_on/auth/login/sign_in_usecase_body_parameters.dart';
import 'package:move_on/widgets/input_textfomfield.dart';

abstract class LoginViewModelInput {
  late LoadingProvider loadingState;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  LoginModel? loginModel = LoginModel(email: '', password: '');
  late TextEditingController dateController;
  late DateTime selectedDate;
  void initState({required LoadingProvider loadingProvider});
  Future<Result<bool, Failure>> login(
      {required String email, required String password});
  // bool isValiDate();
}

abstract class LoginViewModel extends LoginViewModelInput
    implements TextFormFieldDelegate {}

class DefaultLoginViewModel extends LoginViewModel {
  final SignInUseCase _signInUseCase;
  final SaveLocalStorageUseCase _saveLocalStorageUseCase;

  DefaultLoginViewModel(
      {SignInUseCase? inUseCase,
      SaveLocalStorageUseCase? saveLocalStorageUseCase})
      : _signInUseCase = inUseCase ?? DefaultSignInUseCase(),
        _saveLocalStorageUseCase =
            saveLocalStorageUseCase ?? DefaultSaveLocalStorageUseCase();

  @override
  void initState({required LoadingProvider loadingProvider}) {
    loadingState = loadingProvider;
  }

  @override
  onChanged({required String newValue, required InputTextType textInputType}) {
    switch (textInputType) {
      case InputTextType.email:
        loginModel!.email = newValue;
      case InputTextType.password:
        loginModel!.password = newValue;
      case InputTextType.phone:
      case InputTextType.usernname:
      case InputTextType.dateOfBirth:
    }
  }

  @override
  Future<Result<bool, Failure>> login(
      {required String email, required String password}) {
    loadingState.setLoading(isLoading: true);
    return _signInUseCase
        .execute(
            params:
                SignInUseCaseBodyParameters(email: email, password: password))
        .then((result) {
      switch (result.status) {
        case ResultStatus.success:
          loadingState.setLoading(isLoading: false);
          _saveLocalStorageUseCase.execute(
              parameters: SaveLocalStorageParameters(
                  key: LocalStorageKeys.idToken,
                  value: result.value?.idToken ?? ''));
          return Result.success(true);

        case ResultStatus.error:
          loadingState.setLoading(isLoading: false);
          return Result.failure(result.error);
      }
    });
  }

  // @override
  // bool isValiDate() {
  //   return formKey.currentState?.validate() ?? false;
  // }
}
