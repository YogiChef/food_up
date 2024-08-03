import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_on/services/service.dart';

class PriceFilter extends StatefulWidget {
  const PriceFilter({super.key});

  @override
  State<PriceFilter> createState() => _PriceFilterState();
}

class _PriceFilterState extends State<PriceFilter> {
  RangeValues _values = const RangeValues(.3, 1);
  int minPice = 0;
  int maxprice = 10000;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$minPice ฿',
                style: styles(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              Text(
                '$maxprice ฿',
                style: styles(fontSize: 16, fontWeight: FontWeight.w400),
              )
            ],
          ),
          RangeSlider(
              activeColor: orange,
              inactiveColor: Colors.grey,
              values: _values,
              min: 0,
              max: 10000,
              onChanged: (value) {
                setState(() {
                  _values = value;
                  minPice = _values.start.round();
                  maxprice = _values.end.round();
                });
              }),
        ],
      ),
    );
  }
}
