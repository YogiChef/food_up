// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_on/src/datas/places/place_list_entity.dart';
import 'package:move_on/services/service.dart';
import 'vertical_cards_swiper.dart';

class NoveltyPlacesContentView extends StatelessWidget {
  List<PlaceDetailEntity> noveltyPlace = [];
  NoveltyPlacesContentView({super.key, required this.noveltyPlace});

  @override
  Widget build(BuildContext context) {
    return noveltyPlace.isEmpty
        ? Container(
            height: 20.h,
          )
        : Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 12.h, horizontal: 6.w),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Discover new places',
                  style: styles(fontSize: 24, fontWeight: FontWeight.w700),
                ),
              ),
              VerticalCardsSwiper(
                placeList: noveltyPlace,
              ),
            ],
          );
  }
}
