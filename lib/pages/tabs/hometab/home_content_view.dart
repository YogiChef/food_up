import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_on/pages/tabs/hometab/popular_places_content_view.dart';
import 'package:move_on/services/service.dart';
import 'package:move_on/pages/tabs/hometab/home_view_model.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'novelty_places_content_view.dart';
import 'search_topbar.dart';

class HomeContentView extends StatelessWidget {
  final HomeViewModel viewModel;
  const HomeContentView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Column(
                children: [
                  const SearchTopbar(),
                  NoveltyPlacesContentView(
                    noveltyPlace: viewModel.noveltyPlaces,
                  ),
                  PopularPlacesContentView(
                      popularPlaces: viewModel.popularPlaces),
                  Container(
                    margin: EdgeInsets.only(bottom: 12.h, top: 12.h),
                    padding: EdgeInsets.only(left: 6.w),
                    height: height * 0.17,
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
                                    ClipRRect(
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
                                        height: height * .165,
                                        width: width * .6,
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
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
