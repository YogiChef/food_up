import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_on/auth/users/user_photo_helpers.dart';
import 'package:move_on/src/datas/places/place_list_entity.dart';
import 'package:move_on/services/service.dart';
import 'package:move_on/src/views/base_view.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class VerticalCardsSwiper extends StatelessWidget {
  final List<PlaceDetailEntity> placeList;
  const VerticalCardsSwiper({super.key, required this.placeList});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 6.h),
      padding: EdgeInsets.only(left: 6.w),
      height: height * 0.35,
      width: width,
      child: Swiper(
        itemCount: 1,
        itemBuilder: (context, index) {
          return ListView.builder(
              itemCount: placeList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return VerticalCardView(
                  cardView: placeList[index],
                );
              });
        },
        autoplay: true,
        autoplayDelay: Duration.millisecondsPerMinute,
      ),
    );
  }
}

class VerticalCardView extends StatelessWidget with BaseView {
  final PlaceDetailEntity cardView;
  VerticalCardView({super.key, required this.cardView});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 12.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'place_detail');
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: CachedNetworkImage(
                imageUrl: cardView.imgs?.first ??
                    DefaultCardImage.defaultCardImageUrl,
                placeholder: (context, url) => Shimmer(
                  color: Colors.yellow.shade900,
                  colorOpacity: 0,
                  enabled: true,
                  direction: const ShimmerDirection.fromLTRB(),
                  child: Container(
                    color: Colors.yellow.shade900.withOpacity(0.3),
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fit: BoxFit.cover,
                height: height * .25,
                width: width * .5,
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: EdgeInsets.only(left: 6.w, right: 6.w, top: 6.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cardView.phoneNumber,
                    style: styles(fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    cardView.address,
                    overflow: TextOverflow.ellipsis,
                    style: styles(fontSize: 12, color: Colors.black38),
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
                            '${cardView.ratings}',
                            style: styles(fontSize: 10, color: Colors.grey),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Text(
                            '245 ratings',
                            style: styles(fontSize: 10, color: Colors.grey),
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
    );
  }
}
