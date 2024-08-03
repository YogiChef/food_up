import 'package:flutter/material.dart';
import 'package:move_on/services/service.dart';
import 'package:move_on/widgets/heading.dart';

class CollectionCard extends StatelessWidget {
  const CollectionCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'collection_detail');
      },
      child: Stack(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image(
              width: width * .45,
              height: height * .3,
              fit: BoxFit.cover,
              image: const NetworkImage(
                  'https://cookingchew.com/wp-content/uploads/2021/06/foods-that-start-with-L-480x480.jpg.webp')),
        ),
        Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Header(
                text: 'Asia',
                style: styles(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
              Header(
                text: '231 places',
                style: styles(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
