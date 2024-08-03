import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_on/services/service.dart';
import 'package:move_on/widgets/heading.dart';

class EmptyFavourite extends StatelessWidget {
  const EmptyFavourite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: const Text(''),
        title: Header(
          text: 'My Favourite',
          style: styles(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 20.h),
              child: Text(
                'Your Favourite Is Empty!',
                style: styles(
                    color: orange, fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ),
            Text(
              'Good food is always cooking Go\nahead, order some yummy items from\nthe menu',
              textAlign: TextAlign.center,
              style: styles(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
