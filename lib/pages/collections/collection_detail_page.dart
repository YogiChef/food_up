import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_on/services/service.dart';
import 'package:move_on/widgets/heading.dart';

import 'places_card.dart';

class CollectionDetailPage extends StatelessWidget {
  const CollectionDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: height * .3,
            automaticallyImplyLeading: false,
            leading: Padding(
              padding: EdgeInsets.only(left: 12.w),
              child: CircleAvatar(
                radius: 20.r,
                backgroundColor: Colors.yellow.shade50,
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    size: 20.r,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                alignment: Alignment.center,
                children: [
                  Image(
                      width: width,
                      fit: BoxFit.cover,
                      image: const NetworkImage(
                          'https://cookingchew.com/wp-content/uploads/2021/06/foods-that-start-with-L-480x480.jpg.webp')),
                  Container(
                    decoration:
                        BoxDecoration(color: Colors.black.withOpacity(0.2)),
                  ),
                  Center(
                    child: Header(
                      text: 'Asia\nRestaurant',
                      textAlign: TextAlign.center,
                      style: styles(fontSize: 24, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Header(
                    text: '128 places',
                    style: styles(fontSize: 20, fontWeight: FontWeight.w700),
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
