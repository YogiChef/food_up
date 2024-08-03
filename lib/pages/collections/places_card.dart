import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_on/services/service.dart';

class PlacesCard extends StatelessWidget {
  final String url;
  const PlacesCard({
    super.key,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
                color: Color.fromRGBO(210, 211, 215, 1),
                offset: Offset(0, 5),
                blurRadius: 10)
          ]),
      child: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(6),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image(
                          width: 90.w,
                          height: 90.h,
                          fit: BoxFit.cover,
                          image: NetworkImage(url)),
                    ),
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.only(left: 12.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Andy & Cindy',
                              style: styles(
                                  fontSize: 14, fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              '173 M.1 T.Nongpunta A.Sophisai ',
                              style:
                                  styles(fontSize: 12, color: Colors.black38),
                            ),
                            SizedBox(
                              height: 6.h,
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
                                      style: styles(
                                          fontSize: 12.sp, color: Colors.grey),
                                    ),
                                    SizedBox(
                                      width: 8.w,
                                    ),
                                    Text(
                                      '245 ratings',
                                      style: styles(
                                          fontSize: 12.sp, color: Colors.grey),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 12.w, vertical: 4.h),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: orange,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Text(
                                        'Delivery',
                                        style: styles(
                                            fontSize: 11.sp,
                                            color: Colors.white),
                                      )),
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
          Positioned(
              top: 0.h,
              right: -4.w,
              child: SizedBox(
                height: 40.h,
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.bookmark_border_outlined)),
              ))
        ],
      ),
    );
  }
}
