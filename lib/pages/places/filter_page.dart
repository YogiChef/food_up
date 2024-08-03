import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_on/services/service.dart';
import 'package:move_on/pages/cuisines/cuisines_filter_page.dart';
import 'package:move_on/pages/cuisines/filter_check.dart';
import 'package:move_on/pages/cuisines/price_filter.dart';
import 'package:move_on/pages/cuisines/sortby_check.dart';
import 'package:move_on/widgets/heading.dart';

class FilterPage extends StatelessWidget {
  const FilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          alignment: Alignment.center,
          child: Header(
            text: 'Reset',
            style: styles(fontSize: 16.sp, fontWeight: FontWeight.w700),
          ),
        ),
        title: Header(
          text: 'Filters',
          style: styles(fontSize: 24.sp, fontWeight: FontWeight.w700),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Header(
                text: 'Done',
                style: styles(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: orange),
              ),
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: CustomScrollView(slivers: [
        SliverList(
            delegate: SliverChildListDelegate([
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Header(
                  text: 'Cuisnes'.toUpperCase(),
                  style: styles(
                      fontSize: 17,
                      color: Colors.grey,
                      fontWeight: FontWeight.w700),
                ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: const CuisinesFilterPage()),
                Padding(
                  padding: EdgeInsets.only(top: 30.h),
                  child: Text(
                    'Sort by'.toUpperCase(),
                    style: styles(
                        fontSize: 17,
                        color: Colors.grey,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                const SortByCheck(),
                Padding(
                  padding: EdgeInsets.only(top: 30.h),
                  child: Text(
                    'Filter'.toUpperCase(),
                    style: styles(
                        fontSize: 17,
                        color: Colors.grey,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                const FilterCheck(),
                Padding(
                  padding: EdgeInsets.only(top: 30.h),
                  child: Text(
                    'Price'.toUpperCase(),
                    style: styles(
                        fontSize: 17,
                        color: Colors.grey,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                const PriceFilter(),
              ],
            ),
          ),
        ]))
      ]),
    );
  }
}
