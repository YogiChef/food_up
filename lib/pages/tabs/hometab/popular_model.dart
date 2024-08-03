import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_on/auth/users/user_photo_helpers.dart';
import 'package:move_on/services/service.dart';
import 'package:move_on/src/datas/places/place_list_entity.dart';

class PopularCardViewModel extends StatelessWidget {
  final PlaceDetailEntity detailEntity;
  final bool hasFreeDelivery;
  const PopularCardViewModel(
      {super.key, required this.detailEntity, required this.hasFreeDelivery});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: .5,
      margin: EdgeInsets.only(top: 6.h),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 8,
              top: 8.h,
              right: 8.w,
              bottom: 8.w,
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image(
                      width: 80.w,
                      height: 80.h,
                      fit: BoxFit.cover,
                      image: NetworkImage(detailEntity.imgs?.first ??
                          DefaultCardImage.defaultCardImageUrl)),
                ),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(left: 12.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 4.h),
                          child: Text(
                            detailEntity.placeName,
                            overflow: TextOverflow.fade,
                            style: styles(
                                fontSize: 14, fontWeight: FontWeight.w700),
                          ),
                        ),
                        Text(
                          detailEntity.address,
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
                                  '${detailEntity.ratingAverage}',
                                  style:
                                      styles(fontSize: 12, color: Colors.grey),
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Text(
                                  '${detailEntity.ratings} ratings',
                                  style:
                                      styles(fontSize: 12, color: Colors.grey),
                                ),
                              ],
                            ),
                            const Spacer(),
                            hasFreeDelivery
                                ? GestureDetector(
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
                                              fontSize: 11,
                                              color: Colors.white),
                                        )),
                                  )
                                : const SizedBox.shrink(),
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
