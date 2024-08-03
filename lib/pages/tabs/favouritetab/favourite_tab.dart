import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_on/services/service.dart';
import 'package:move_on/pages/collections/places_card.dart';
import 'package:move_on/pages/tabs/favouritetab/empty_favourite.dart';
import 'package:move_on/widgets/heading.dart';

class FavouriteTab extends StatefulWidget {
  const FavouriteTab({super.key});

  @override
  State<FavouriteTab> createState() => _FavouriteTabState();
}

const emptyFavourite = false;

class _FavouriteTabState extends State<FavouriteTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: emptyFavourite
          ? const EmptyFavourite()
          : CustomScrollView(
              slivers: [
                SliverAppBar(
                  elevation: 0.5,
                  leading: const Text(''),
                  title: Header(
                    text: 'My Favourite',
                    style: styles(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  centerTitle: true,
                ),
                SliverList(
                    delegate: SliverChildListDelegate([
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Header(
                          text: '128 places',
                          style:
                              styles(fontSize: 20, fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  ),
                  const PlacesCard(
                    url:
                        'https://cookingchew.com/wp-content/uploads/2021/06/foods-that-start-with-L-480x480.jpg.webp',
                  ),
                  const PlacesCard(
                    url:
                        'https://cookingchew.com/wp-content/uploads/2021/06/foods-that-start-with-L-480x480.jpg.webp',
                  ),
                  const PlacesCard(
                    url:
                        'https://cookingchew.com/wp-content/uploads/2021/06/foods-that-start-with-L-480x480.jpg.webp',
                  ),
                  const PlacesCard(
                    url:
                        'https://cookingchew.com/wp-content/uploads/2021/06/foods-that-start-with-L-480x480.jpg.webp',
                  ),
                ]))
              ],
            ),
    );
  }
}
