import 'package:flutter/material.dart';
import 'package:move_on/services/local_key.dart';
import 'package:move_on/src/base/localstores/local_storage_usecase_parameters.dart';
import 'package:move_on/services/validate_usecase.dart';
import 'package:move_on/src/base/localstores/fetch_local_storage_usecase.dart';

class RoutersPath {
  static String welcomePath = 'welcome_page';
  static String tabsPath = 'home_tab';
}

class MainCoordinator {
  final FetchLocalStorageUseCase _fetchLocalStorageUseCase;
  // ignore: unused_field
  final ValidateUseCase _validateUseCase;

  MainCoordinator(
      {FetchLocalStorageUseCase? fetchLocalStorageUseCase,
      ValidateUseCase? validateUseCase})
      : _fetchLocalStorageUseCase =
            fetchLocalStorageUseCase ?? DefaultFetchLocalStorageUseCase(),
        _validateUseCase = validateUseCase ?? DefaultValidateUseCase();

  Future<String?> start() {
    return _isUserLoged().then((value) {
      return value == null ? RoutersPath.welcomePath : RoutersPath.tabsPath;
    });
  }

  Future<String?> _isUserLoged() async {
    var idToken = await _fetchLocalStorageUseCase.execute(
        parameters: FetchLocalStorageParameters(key: LocalStorageKeys.idToken));
    return idToken;
    /* if (idToken == null) {
      return null;
    }
    var isUserValid = await _validateUseCase.execute(idToken: idToken);
    if (isUserValid) {
      return idToken;
    } else {
      return null;
    }*/
  }

  showTabsPage({required BuildContext context}) {
    Navigator.pushNamed(context, RoutersPath.tabsPath);
  }
}
