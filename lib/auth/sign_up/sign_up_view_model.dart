// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:move_on/auth/sign_up/sign_up_model.dart';
import 'package:move_on/services/local_key.dart';
import 'package:move_on/src/base/api_sevices/errors/api_error.dart';
import 'package:move_on/auth/login/loading_provider.dart';
import 'package:move_on/src/base/api_sevices/errors/result_type.dart';
import 'package:move_on/src/base/localstores/local_storage_usecase_parameters.dart';
import 'package:move_on/src/base/localstores/save_local_storage_usecase.dart';
import 'package:move_on/auth/sign_up/sign_up_usecase.dart';
import 'package:move_on/auth/sign_up/sign_up_usecase_parameters.dart';
import 'package:move_on/src/views/base_view.dart';
import 'package:move_on/widgets/input_textfomfield.dart';

abstract class SignUpViewModelInput {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController dateController;
  late DateTime selectedDate;
  SignUpModel? signUpModel = SignUpModel();

  Future<Result<bool, Failure>> signUp();
  // bool isValiDate();
}

abstract class SignUpViewModel extends SignUpViewModelInput
    implements TextFormFieldDelegate, BaseViewModel {}

class DefaultSignUpViewModel extends SignUpViewModel {
  final SignUpUseCase _signUpUseCase;
  final SaveLocalStorageUseCase _storageUseCase;
  @override
  late LoadingStateProvider loadingState;

  DefaultSignUpViewModel({
    SignUpUseCase? signUpUseCase,
    SaveLocalStorageUseCase? storageUseCase,
  })  : _signUpUseCase = signUpUseCase ?? DefaultSignUpUseCas(),
        _storageUseCase = storageUseCase ?? DefaultSaveLocalStorageUseCase();

  @override
  void initState({required LoadingStateProvider loadingProvider}) {
    loadingState = loadingProvider;
    dateController = TextEditingController();
    selectedDate = DateTime.now();
  }

  @override
  Future<Result<bool, Failure>> signUp() {
    loadingState.setLoading(isLoading: true);
    return _signUpUseCase
        .execute(
            params: SignUpUseCaseParameters(
                username: signUpModel!.username ?? '',
                email: signUpModel!.email ?? '',
                password: signUpModel!.password ?? '',
                phone: signUpModel!.phone ?? '',
                date: signUpModel!.date ?? ''))
        .then((result) {
      switch (result.status) {
        case ResultStatus.success:
          _storageUseCase.execute(
              parameters: SaveLocalStorageParameters(
                  key: LocalStorageKeys.idToken,
                  value: result.value?.idToken ?? ''));
          loadingState.setLoading(isLoading: false);
          return Result.success(true);
        case ResultStatus.error:
          loadingState.setLoading(isLoading: false);
          return Result.failure(result.error);
      }
    });
  }

  @override
  onChanged({required String newValue, required InputTextType textInputType}) {
    switch (textInputType) {
      case InputTextType.email:
        signUpModel?.email = newValue;
      case InputTextType.password:
        signUpModel?.password = newValue;
      case InputTextType.phone:
        signUpModel?.phone = newValue;
      case InputTextType.usernname:
        signUpModel?.username = newValue;
      case InputTextType.dateOfBirth:
      // signUpModel?.date = newValue;
    }
  }

  // @override
  // bool isValiDate() {
  //   return formKey.currentState?.validate() ?? false;
  // }
}
