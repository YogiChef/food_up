import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_on/services/service.dart';
import 'package:move_on/widgets/heading.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key,
    required this.title,
    required this.itemCount,
  });
  final String title;
  final String itemCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Header(
            text: title,
            style: styles(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          trailing: Header(
            text: itemCount,
            style: styles(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 6.h),
          padding: EdgeInsets.only(left: 12.w),
          height: height * 0.2,
          width: width,
          child: Swiper(
            itemCount: 1,
            itemBuilder: (context, index) {
              return ListView.builder(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 12.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        'https://cookingchew.com/wp-content/uploads/2021/06/foods-that-start-with-L-480x480.jpg.webp',
                                    placeholder: (context, url) => Shimmer(
                                      color: Colors.yellow.shade900,
                                      colorOpacity: 0,
                                      enabled: true,
                                      direction:
                                          const ShimmerDirection.fromLTRB(),
                                      child: Container(
                                        color: Colors.yellow.shade900
                                            .withOpacity(0.3),
                                      ),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                    fit: BoxFit.cover,
                                    height: height * .12,
                                    width: width * .4,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 12.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Beef Lasagna',
                                      style: styles(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      '฿ 259',
                                      style: styles(
                                          fontSize: 12, color: Colors.black38),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                            bottom: 14,
                            right: 14,
                            child: Icon(
                              Icons.add_circle_outline,
                              color: orange,
                              size: 18.r,
                            ))
                      ],
                    );
                  });
            },
            autoplay: true,
            autoplayDelay: Duration.millisecondsPerMinute,
          ),
        ),
        Divider(
          color: Colors.grey,
          height: 0.5,
          indent: 12.w,
          endIndent: 12.w,
          thickness: 0.5,
        )
      ],
    );
  }
}
