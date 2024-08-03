// ignore_for_file: unused_field

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:move_on/auth/passwords/forgot_password.dart';
import 'package:move_on/auth/login/login_page.dart';
import 'package:move_on/auth/sign_up/sign_up_page.dart';
import 'package:move_on/pages/collections/collection_detail_page.dart';
import 'package:move_on/pages/collections/collections_page.dart';
import 'package:move_on/pages/places/filter_page.dart';
import 'package:move_on/src/datas/places/place_detail.dart';
import 'package:move_on/pages/search/search_page.dart';
import 'package:move_on/auth/welcome/welcome_page.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_on/src/base/api_sevices/errors/error_provider.dart';
import 'package:move_on/auth/login/loading_provider.dart';
import 'package:move_on/src/views/base_view.dart';
import 'package:move_on/pages/tabs/exploretab/explore_tab.dart';
import 'package:move_on/pages/tabs/profiletab/edit_profile.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyBnr1I_xE9OxQPGqHMthLyGQzGCEtyDHF8',
      appId: '1:669789685566:android:82b2d2db0079e1c7340e6f',
      messagingSenderId: '669789685566',
      projectId: 'food-up-5abbc',
      storageBucket: 'food-up-5abbc.appspot.com',
    ),
  );
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ErrorStateProvider()),
    ChangeNotifierProvider(create: (_) => LoadingStateProvider()),
  ], child: MyAppUserState()));
}

class MyAppUserState extends StatelessWidget with BaseView {
  MyAppUserState({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: coordinator.start(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return MyApp(
              initialRoute: snapshot.data,
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.green,
              ),
            );
          }
        });
  }
}

class MyApp extends StatelessWidget {
  final String _initialRoute;

  const MyApp({super.key, required String initialRoute})
      : _initialRoute = initialRoute;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    ));
    return ScreenUtilInit(
        designSize: const Size(375, 825),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'First Method',
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              iconTheme: const IconThemeData(color: Colors.black26),
              primarySwatch: Colors.blue,
              textTheme: Typography.englishLike2018
                  .apply(fontSizeFactor: 1.sp, bodyColor: Colors.black),
            ),
            initialRoute: _initialRoute,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en', ''),
              Locale('en', ''),
            ],
            routes: {
              'welcome_page': (context) => const WelcomePage(),
              'login': (context) => const LoginPage(),
              'forgotpassword': (context) => const ForgotPassword(),
              'signup': (context) => const SignUpPage(),
              'home_tab': (context) => const HomeTabPage(),
              'search': (context) => const SearchPage(),
              'filter': (context) => const FilterPage(),
              'collections': (context) => const CollectionsPage(),
              'collection_detail': (context) => const CollectionDetailPage(),
              'place_detail': (context) => const PlaceDetail(),
              'edit_profile': (context) => const EditProfile(),
            },
            home: const LoginPage(),
          );
        });
  }
}
