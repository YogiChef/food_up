// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_on/services/service.dart';
import 'package:move_on/src/base/api_sevices/errors/api_error.dart';
import 'package:move_on/auth/login/loading_provider.dart';
import 'package:move_on/src/base/api_sevices/errors/result_type.dart';
import 'package:move_on/src/base/api_sevices/geolocations/geolocation_entity.dart';
import 'package:move_on/pages/tabs/favouritetab/favourite_tab.dart';
import 'package:move_on/pages/tabs/hometab/home_tab.dart';
import 'package:move_on/pages/tabs/ordertab/order_tab.dart';
import 'package:move_on/pages/tabs/profiletab/profile_tab.dart';
import 'package:move_on/src/views/base_view.dart';
import 'package:move_on/pages/tabs/exploretab/exploretap_view_model.dart';
import 'package:move_on/widgets/dialog.dart';
import 'package:provider/provider.dart';

class HomeTabPage extends StatefulWidget {
  const HomeTabPage({super.key});

  @override
  State<HomeTabPage> createState() => _HomeTabPageState();
}

class _HomeTabPageState extends State<HomeTabPage> with BaseView {
  int pageIndex = 0;

  final List<Widget> _pages = [
    const HomeTab(),
    const OrderTab(),
    const FavouriteTab(),
    const ProfileTab()
  ];

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      _viewModel.loadingState.setLoading(isLoading: true);
      final LocationPermissionStatus currentStatus =
          await _viewModel.getPermission();
      switch (currentStatus) {
        case LocationPermissionStatus.denied:
          _getCurrentPosition(context);
        default:
          _viewModel.loadingState.setLoading(isLoading: false);
          break;
      }
    });
    super.initState();
  }

  final TabsPageViewModel _viewModel;
  _HomeTabPageState({TabsPageViewModel? viewModel})
      : _viewModel = viewModel ?? DefaultTabsPageViewModel();

  @override
  Widget build(BuildContext context) {
    _viewModel.initState(
        loadingProvider: Provider.of<LoadingStateProvider>(context));
    return _viewModel.loadingState.isloading
        ? loadingView
        : Scaffold(
            body: _pages.elementAt(pageIndex),
            bottomNavigationBar: _bottomNavigationBar(context),
          );
  }
}

extension PrivateMethods on _HomeTabPageState {
  BottomNavigationBar _bottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
        onTap: _changeTabs,
        currentIndex: pageIndex,
        selectedItemColor: orange,
        unselectedItemColor: Colors.grey,
        elevation: 0,
        iconSize: 22.r,
        selectedFontSize: 14.sp,
        selectedLabelStyle:
            styles(fontSize: 14, fontWeight: FontWeight.bold, letterSpacing: 1),
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                pageIndex == 0 ? Icons.explore : Icons.explore_outlined,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(
              pageIndex == 1
                  ? Icons.sticky_note_2
                  : Icons.sticky_note_2_outlined,
            ),
            label: 'Order',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                pageIndex == 2
                    ? Icons.bookmark
                    : Icons.bookmark_border_outlined,
              ),
              label: 'Favourite'),
          BottomNavigationBarItem(
              icon: Icon(
                pageIndex == 3 ? Icons.account_box : Icons.account_box_outlined,
              ),
              label: 'Profile'),
        ]);
  }

  Future _getCurrentPosition(BuildContext context) async {
    return SendDialog.showMyDialog(
        contant:
            'Please allow to use your location to show nearby restaurant on the map. ',
        context: context,
        img: const AssetImage('images/location.webp'),
        text: 'Enable Location',
        tabYes: () {
          _viewModel.getCurrentPosition().then((value) {
            switch (value.status) {
              case ResultStatus.success:
                Navigator.pop(context);
                _viewModel.loadingState.setLoading(isLoading: false);
              case ResultStatus.error:
                Navigator.pop(context);
                _viewModel.loadingState.setLoading(isLoading: false);
                return Result.failure(
                    Failure.fromMessage(message: 'value.error??'));
            }
          });
        },
        title: 'Enable Your Location');
  }
}

extension UserActions on _HomeTabPageState {
  void _changeTabs(int val) {
    // ignore: invalid_use_of_protected_member
    setState(() {
      pageIndex = val;
    });
  }
}
