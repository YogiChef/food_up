// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_on/pages/tabs/hometab/popular_place_card_swiper.dart';
import 'package:move_on/src/datas/places/place_list_entity.dart';
import 'package:move_on/src/views/base_view.dart';
import 'package:move_on/widgets/heading.dart';

class PopularPlacesContentView extends StatelessWidget with BaseView {
  List<PlaceDetailEntity> popularPlaces = [];
  PopularPlacesContentView({super.key, required this.popularPlaces});

  @override
  Widget build(BuildContext context) {
    return popularPlaces.isEmpty
        ? Container(
            height: 20.h,
          )
        : Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: const TitleText(
                  text: 'Popular this week',
                  title: 'Show all',
                ),
              ),
              PopularPlaceCardSwiper(
                placeList: popularPlaces,
                isShortedVisualization: true,
                swiperStyle: PlaceListSwiperStyle.list,
              ),
            ],
          );
  }
}
