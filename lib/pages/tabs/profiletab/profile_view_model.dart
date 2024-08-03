import 'package:move_on/auth/login/loading_provider.dart';
import 'package:move_on/auth/signout/sign_out_usercase.dart';

abstract class ProfileViewModelInput {
  late LoadingStateProvider loadingStateProvider;

  Future<void> signOut();
  void initState({required LoadingStateProvider loadingState});
}

abstract class ProfileViewModel extends ProfileViewModelInput {}

class DefaultProfileViewModel extends ProfileViewModel {
  final SignOutUseCase _signOutUseCase;

  DefaultProfileViewModel({SignOutUseCase? signOutUseCase})
      : _signOutUseCase = signOutUseCase ?? DefaultSignOutUserCase();

  @override
  void initState({required LoadingStateProvider loadingState}) {
    loadingStateProvider = loadingState;
  }

  @override
  Future<void> signOut() {
    loadingStateProvider.setLoading(isLoading: true);
    return _signOutUseCase
        .execute()
        .then((value) => loadingStateProvider.setLoading(isLoading: false));
  }
}
