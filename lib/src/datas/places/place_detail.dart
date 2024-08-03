import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_on/services/service.dart';
import 'package:move_on/widgets/heading.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../../../pages/places/menu_item.dart';

class PlaceDetail extends StatelessWidget {
  const PlaceDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: height * .5,
            leading: Padding(
              padding: EdgeInsets.only(left: 12.w),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  size: 24.r,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(children: [
                Image(
                    width: width,
                    height: height * .45,
                    fit: BoxFit.cover,
                    image: const NetworkImage(
                        'https://images.immediate.co.uk/production/volatile/sites/30/2020/08/chilli-ginger-squash-kale-quinoa-ae1d320.jpg')),
                Container(
                  height: height * .45,
                  decoration:
                      BoxDecoration(color: Colors.black.withOpacity(0.2)),
                ),
                Wrap(
                  children: [
                    Container(
                      margin:
                          EdgeInsets.only(top: 121.h, left: 30.w, right: 15.w),
                      height: 27.h,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.w, vertical: 3.h),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: orange,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Text(
                                  'Free Delivery',
                                  style:
                                      styles(fontSize: 11, color: Colors.white),
                                )),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 30.w),
                          margin: EdgeInsets.symmetric(vertical: 16.h),
                          child: Header(
                            text: 'Boon Lay Ho Huat Fried Prawn Noodle',
                            style: styles(
                                fontSize: 24.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 30.w),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                color: Colors.white54,
                              ),
                              Text(
                                '173 M.1 T.Nongpunta A. Sophisai',
                                overflow: TextOverflow.ellipsis,
                                style: styles(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white54),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Container(
                      alignment: Alignment.bottomLeft,
                      margin: EdgeInsets.only(top: 25.h),
                      padding: EdgeInsets.symmetric(horizontal: 30.w),
                      height: 70.h,
                      decoration: const BoxDecoration(
                          border: Border(
                        top: BorderSide(color: Colors.white54),
                      )),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      size: 18.r,
                                      color: Colors.white,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 6.w),
                                      child: Text(
                                        '4.5',
                                        style: styles(
                                          fontSize: 14,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Header(
                                  text: '342 Ratings',
                                  style: styles(
                                    fontSize: 14,
                                    color: Colors.white70,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                            Container(
                              height: 40.h,
                              decoration: const BoxDecoration(
                                  border: Border(
                                      right:
                                          BorderSide(color: Colors.white54))),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.bookmark,
                                      size: 18.r,
                                      color: Colors.white,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 6.w),
                                      child: Text(
                                        '135k',
                                        style: styles(
                                          fontSize: 14,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Header(
                                  text: 'Favourite',
                                  style: styles(
                                    fontSize: 14,
                                    color: Colors.white70,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                            Container(
                              height: 40.h,
                              decoration: const BoxDecoration(
                                  border: Border(
                                      right:
                                          BorderSide(color: Colors.white54))),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.photo,
                                      size: 18.r,
                                      color: Colors.white,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 6.w),
                                      child: Text(
                                        '345',
                                        style: styles(
                                          fontSize: 14,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Header(
                                  text: 'Photos',
                                  style: styles(
                                    fontSize: 14,
                                    color: Colors.white70,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                          ]),
                    ),
                    Container(
                      color: const Color(0xFFFFE0B2),
                      padding: const EdgeInsets.all(20),
                      height: 90.h,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Header(
                                text: 'New! Try Pickup',
                                style: styles(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w700,
                                    color: orange),
                              ),
                              Header(
                                text: 'Pickup on your time.',
                                style: styles(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                                height: 30.h,
                                margin: EdgeInsets.only(top: 2.h),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.w, vertical: 3.h),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: orange,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Text(
                                  'Order Now',
                                  style:
                                      styles(fontSize: 11, color: Colors.white),
                                )),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ]),
            ),
            actions: [
              Container(
                margin: const EdgeInsets.all(10),
                child: Icon(
                  Icons.share,
                  size: 20.r,
                  color: Colors.white,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: Icon(
                  Icons.bookmark_border_outlined,
                  size: 20.r,
                  color: Colors.white,
                ),
              )
            ],
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
                margin: EdgeInsets.only(
                    left: 12.w, right: 12.w, top: 20.h, bottom: 12.h),
                alignment: Alignment.bottomLeft,
                child: Header(
                  text: 'Featured Items',
                  style: styles(fontSize: 20, fontWeight: FontWeight.w700),
                )),
            Container(
              margin: EdgeInsets.only(bottom: 6.h),
              padding: EdgeInsets.only(left: 12.w),
              height: height * 0.26,
              width: width,
              child: Swiper(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return ListView.builder(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
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
                                    height: height * .17,
                                    width: width * .55,
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
                        );
                      });
                },
                autoplay: true,
                autoplayDelay: Duration.millisecondsPerMinute,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 12.w,
              ),
              margin: EdgeInsets.only(top: 12.h),
              child: Header(
                text: 'Full menu',
                textAlign: TextAlign.start,
                style: styles(fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ),
            const Column(
              children: [
                MenuItem(
                  title: 'Popular items',
                  itemCount: '5',
                ),
                MenuItem(
                  title: 'Salads',
                  itemCount: '14',
                ),
                MenuItem(
                  title: 'Chicken',
                  itemCount: '7',
                ),
                MenuItem(
                  title: 'Soups',
                  itemCount: '25',
                ),
                MenuItem(
                  title: 'Vegetables',
                  itemCount: '16',
                ),
                MenuItem(
                  title: 'Noodles',
                  itemCount: '25',
                ),
                MenuItem(
                  title: 'Drinks',
                  itemCount: '15',
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 12.w,
              ),
              margin: EdgeInsets.only(top: 30.h),
              child: Header(
                text: 'Reviews',
                textAlign: TextAlign.start,
                style: styles(fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              height: height * 0.12,
              padding: EdgeInsets.only(left: 12.w),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 4,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(top: 12.h),
                      padding: EdgeInsets.only(left: 12.w, right: 12.w),
                      width: width * 0.95,
                      height: 100.h,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image(
                                    width: 45.w,
                                    height: 43.h,
                                    fit: BoxFit.cover,
                                    image: const NetworkImage(
                                        'https://images.immediate.co.uk/production/volatile/sites/30/2020/08/chilli-ginger-squash-kale-quinoa-ae1d320.jpg')),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 12.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Header(
                                      text: "Mike Smithson",
                                      style: styles(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Header(
                                      text: "45 Reviews",
                                      style: styles(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const Spacer(),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Container(
                                  width: 55.w,
                                  height: 30.h,
                                  color: orange,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '4',
                                        style: styles(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white),
                                      ),
                                      const Icon(
                                        Icons.star,
                                        color: Colors.white,
                                        size: 18,
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10.h),
                            child: Header(
                              text:
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut ',
                              style: styles(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 12.w,
              ),
              margin: EdgeInsets.only(top: 30.h),
              child: Header(
                text: 'Your rating',
                textAlign: TextAlign.start,
                style: styles(fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 12.h),
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 0.w),
                    alignment: Alignment.center,
                    height: 30.h,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        buttonRating('1', const Color(0xFFFFE0B2)),
                        buttonRating('2', const Color(0xFFFFE0B2)),
                        buttonRating('3', const Color(0xFFFFE0B2)),
                        buttonRating('4', orange),
                        buttonRating('5', const Color(0xFFFFE0B2)),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                    ),
                    margin: EdgeInsets.only(top: 30.h),
                    child: Header(
                      text: 'We would love to hear more about your experience!',
                      textAlign: TextAlign.left,
                      style: styles(fontSize: 12, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.w),
                    child: Header(
                      text: '+ Edit your review',
                      textAlign: TextAlign.left,
                      style: styles(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: orange),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 120.h,
            ),
          ]))
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        width: width * 0.8,
        height: 40,
        child: FloatingActionButton.extended(
          backgroundColor: orange,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          onPressed: () {},
          label: Text(
            'Total: 2345 ฿',
            style: styles(
                fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Container buttonRating(
    String text,
    Color? color,
  ) {
    return Container(
      width: 55.w,
      height: 30.h,
      margin: EdgeInsets.only(left: 12.w),
      decoration: BoxDecoration(
          color: color ?? Colors.yellow.shade500,
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: styles(
                fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),
          ),
          const Icon(
            Icons.star,
            color: Colors.white,
            size: 18,
          )
        ],
      ),
    );
  }
}
