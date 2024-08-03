import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_on/services/service.dart';

class RecommendModel extends StatelessWidget {
  const RecommendModel({
    super.key,
    required this.url,
  });
  final String url;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 6.h,
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 16.h),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image(
                        width: 80.w,
                        height: 80.h,
                        fit: BoxFit.cover,
                        image: NetworkImage(url)),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(left: 12.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Andy & Cindy',
                          style:
                              styles(fontSize: 14, fontWeight: FontWeight.w700),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 6.h),
                          child: Text(
                            '173 M.1 T.Nongpunta A.Sophisai ',
                            style: styles(fontSize: 12, color: Colors.black38),
                          ),
                        ),
                        Row(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow.shade700,
                                  size: 14.r,
                                ),
                                Text(
                                  ' 4.5',
                                  style:
                                      styles(fontSize: 12, color: Colors.grey),
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Text(
                                  '245 ratings',
                                  style:
                                      styles(fontSize: 12, color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
