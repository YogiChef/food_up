import 'package:flutter/material.dart';
import 'package:move_on/src/base/api_sevices/geolocations/geolocation_failure_messages_service.dart';
import 'package:move_on/pages/tabs/hometab/home_content_view.dart';
import 'package:move_on/pages/tabs/hometab/home_view_model.dart';
import 'package:move_on/src/views/base_view.dart';
import 'package:move_on/src/views/error_view.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> with BaseView {
  final HomeViewModel viewModel;
  _HomeTabState({HomeViewModel? homeViewModel})
      : viewModel = homeViewModel ?? DefaultHomeViewModel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder(
          future: viewModel.viewInitState(),
          builder: (BuildContext context,
              AsyncSnapshot<HomeViewModelState> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return loadingView;

              case ConnectionState.done:
                if (snapshot.error ==
                        GeolocationFailureMessages.locationPermissionsDenied ||
                    snapshot.error ==
                        GeolocationFailureMessages
                            .locationPermissionsDeniedForever) {
                  return ErrorNetwork();
                }
                switch (snapshot.data) {
                  case HomeViewModelState.viewLoadedState:
                    return HomeContentView(viewModel: viewModel);
                  default:
                    return ErrorView();
                }
              default:
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.purple,
                  ),
                );
            }
          }),
    );
  }
}
