import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_on/services/service.dart';
import 'package:move_on/pages/search/recommend_model.dart';
import 'package:move_on/widgets/heading.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String searchInput = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  size: 24.r,
                )),
            title: const Header(text: 'Search'),
            centerTitle: true,
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Padding(
              padding: EdgeInsets.only(
                left: 12.w,
                right: 12.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 43.h,
                    child: CupertinoSearchTextField(
                      itemSize: 24.h,
                      autofocus: true,
                      onChanged: (value) {
                        setState(() {
                          searchInput = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  TitleText(
                    text: 'Recent search',
                    title: 'Clear All',
                    icon: Icons.keyboard_double_arrow_right,
                    color: orange,
                    style: styles(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: orange,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 12.h, top: 12.h),
                    height: height * 0.22,
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
                                        height: height * .15,
                                        width: width * .45,
                                      ),
                                    ),
                                    Flexible(
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 6.w, right: 6.w, top: 6.h),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Andy & Cindy',
                                              style: styles(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            Text(
                                              '173 m.1 t.Nongpunta',
                                              overflow: TextOverflow.ellipsis,
                                              style: styles(
                                                  fontSize: 12.sp,
                                                  color: Colors.black38),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            });
                      },
                      autoplay: true,
                      autoplayDelay: Duration.millisecondsPerMinute,
                    ),
                  ),
                  Header(
                    text: 'Recommend for you',
                    style: styles(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  const RecommendModel(
                      url:
                          'https://images.immediate.co.uk/production/volatile/sites/30/2020/08/meatball-lasagne-e64e936.jpg?quality=90&resize=500,454'),
                  const RecommendModel(
                      url:
                          'https://img.taste.com.au/BMU2oLU3/taste/2016/11/beef-shepherds-pie-106408-1.jpeg'),
                  const RecommendModel(
                      url:
                          'https://images.immediate.co.uk/production/volatile/sites/30/2020/08/chilli-ginger-squash-kale-quinoa-ae1d320.jpg'),
                  const RecommendModel(
                      url:
                          'https://www.brugadabar.com/wp-content/uploads/2024/01/Traditional-American-Dish.jpg'),
                  const RecommendModel(
                      url:
                          'https://www.brugadabar.com/wp-content/uploads/2024/01/Traditional-American-Dish.jpg'),
                  const RecommendModel(
                      url:
                          'https://www.brugadabar.com/wp-content/uploads/2024/01/Traditional-American-Dish.jpg'),
                  const RecommendModel(
                      url:
                          'https://www.brugadabar.com/wp-content/uploads/2024/01/Traditional-American-Dish.jpg'),
                ],
              ),
            )
          ])),
        ],
      ),
    );
  }
}
