import 'package:flutter/material.dart';
import 'package:move_on/widgets/botton_widget.dart';

class CuisinesFilterPage extends StatefulWidget {
  const CuisinesFilterPage({super.key});

  @override
  State<CuisinesFilterPage> createState() => _CuisinesFilterPageState();
}

class _CuisinesFilterPageState extends State<CuisinesFilterPage> {
  bool btnAmerican = false;
  bool btnAsia = false;
  bool btnShushi = false;
  bool btnPizza = false;

  bool btnDessert = false;
  bool btnFastfood = false;
  bool btnVietnamese = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RoundedButton(
              text: 'American',
              isActive: btnAmerican,
              onPressed: () {
                setState(() {
                  btnAmerican = !btnAmerican;
                });
              },
            ),
            RoundedButton(
              text: 'Asia',
              isActive: btnAsia,
              onPressed: () {
                setState(() {
                  btnAsia = !btnAsia;
                });
              },
            ),
            RoundedButton(
              text: 'Shushi',
              isActive: btnShushi,
              onPressed: () {
                setState(() {
                  btnShushi = !btnShushi;
                });
              },
            ),
            RoundedButton(
              text: 'Pizza',
              isActive: btnPizza,
              onPressed: () {
                setState(() {
                  btnPizza = !btnPizza;
                });
              },
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RoundedButton(
              text: 'Desserts',
              isActive: btnDessert,
              onPressed: () {
                setState(() {
                  btnDessert = !btnDessert;
                });
              },
            ),
            RoundedButton(
              text: 'Fast Food',
              isActive: btnFastfood,
              onPressed: () {
                setState(() {
                  btnFastfood = !btnFastfood;
                });
              },
            ),
            RoundedButton(
              text: 'Vietnamese',
              isActive: btnVietnamese,
              onPressed: () {
                setState(() {
                  btnVietnamese = !btnVietnamese;
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
