import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_on/auth/welcome/welcome_page.dart';
import 'package:move_on/services/service.dart';
import 'package:move_on/auth/login/loading_provider.dart';
import 'package:move_on/pages/tabs/profiletab/profile_view_model.dart';
import 'package:move_on/widgets/botton_widget.dart';
import 'package:move_on/widgets/dialog.dart';
import 'package:move_on/widgets/heading.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  final ProfileViewModel _viewModel;
  _ProfileTabState({ProfileViewModel? profileViewModel})
      : _viewModel = profileViewModel ?? DefaultProfileViewModel();
  @override
  Widget build(BuildContext context) {
    _viewModel.initState(
        loadingState: Provider.of<LoadingStateProvider>(context));
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: Colors.amber,
              height: 250.h,
              padding: EdgeInsets.only(left: 40.w, top: 20.h, right: 20.w),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 50.r,
                    backgroundImage: const NetworkImage(
                        'https://newprofilepic.photo-cdn.net//assets/images/article/profile.jpg?90af0c8'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 12.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, 'edit_profile');
                          },
                          child: Row(
                            children: [
                              Header(
                                text: 'Cameron Cook',
                                style: styles(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16.r,
                                color: Colors.black54,
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 6.h),
                          height: 40.h,
                          width: width * .5,
                          child: BottonWidget(
                              color: Colors.pink,
                              label: 'VIP Member',
                              style: styles(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                              icon: Icons.star_rate,
                              press: () {}),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
              child: Column(
                children: [
                  _firtsBlock(
                      Colors.red, 'Notification', Icons.notifications, () {}),
                  _firtsBlock(Colors.cyan, 'Payment method', Icons.paid, () {}),
                  _firtsBlock(Colors.blue.shade900, 'Reward credits',
                      Icons.credit_card, () {}),
                  _firtsBlock(orange, 'Promo Code', Icons.reviews, () {}),
                  SizedBox(
                    height: 30.h,
                  ),
                  _firtsBlock(Colors.black, 'Settings', Icons.settings, () {}),
                  _firtsBlock(Colors.green, 'Invite Friends',
                      Icons.manage_accounts, () {}),
                  _firtsBlock(Colors.yellow.shade700, 'Help Center',
                      Icons.headset_mic, () {}),
                  _firtsBlock(Colors.blue, 'About Us', Icons.help, () {}),
                  _firtsBlock(orange, 'Sign Out', Icons.logout_rounded,
                      () => _signOut(context)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _firtsBlock(Color color, String title, IconData icon, Function()? onTap) {
    return ListTile(
      leading: Container(
          width: 27.w,
          height: 27.h,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(5)),
          child: Icon(
            icon,
            color: Colors.white,
            size: 18.r,
          )),
      title: Text(
        title,
        style: styles(
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 16.r,
      ),
      onTap: onTap,
    );
  }

  Future _signOut(BuildContext context) async {
    MyAlertDialog.showMyDialog(
        context: context,
        img: const AssetImage('images/signout.png'),
        title: 'Sign Out',
        contant: 'contant',
        tabNo: () {
          Navigator.pop(context);
        },
        tabYes: () async {
          await _viewModel.signOut().then((_) {
            Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                    pageBuilder: (_, __, ___) => const WelcomePage(),
                    transitionDuration: const Duration(milliseconds: 300)));
          });
        });
  }
}
