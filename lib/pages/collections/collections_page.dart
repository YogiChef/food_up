import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_on/widgets/heading.dart';

import 'collection_card.dart';

class CollectionsPage extends StatelessWidget {
  const CollectionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Header(text: 'Collections'),
            centerTitle: true,
          ),
          SliverPadding(
              padding: EdgeInsets.only(left: 12.w),
              sliver: SliverGrid.count(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                children: const [
                  CollectionCard(),
                  CollectionCard(),
                  CollectionCard(),
                  CollectionCard(),
                  CollectionCard(),
                  CollectionCard(),
                  CollectionCard(),
                  CollectionCard(),
                ],
              ))
        ],
      ),
    );
  }
}
