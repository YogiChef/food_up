import 'package:flutter/material.dart';
import 'package:move_on/pages/tabs/hometab/popular_model.dart';
import 'package:move_on/src/datas/places/place_list_entity.dart';

enum PlaceListSwiperStyle { list, listCards }

class PopularPlaceCardSwiper extends StatelessWidget {
  final List<PlaceDetailEntity> placeList;
  final bool isShortedVisualization;
  final PlaceListSwiperStyle swiperStyle;
  const PopularPlaceCardSwiper(
      {super.key,
      required this.placeList,
      required this.isShortedVisualization,
      required this.swiperStyle});

  @override
  Widget build(BuildContext context) {
    int itemCount = placeList.length > 3 ? 3 : placeList.length;
    int dynamicHeight =
        isShortedVisualization ? 120 * itemCount : 210 * placeList.length;
    return Container(
      alignment: Alignment.topCenter,
      height: dynamicHeight.toDouble(),
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: isShortedVisualization ? itemCount : placeList.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            switch (swiperStyle) {
              case PlaceListSwiperStyle.list:
                PopularCardViewModel(
                  hasFreeDelivery: placeList[index].hasFreeDelivery,
                  detailEntity: placeList[index],
                );
              case PlaceListSwiperStyle.listCards:
              // TODO: Handle this case.
            }
          }),
    );
  }
}
