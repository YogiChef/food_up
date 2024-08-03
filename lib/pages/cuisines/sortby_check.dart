import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_on/services/service.dart';
import 'package:move_on/widgets/heading.dart';

class SortByCheck extends StatefulWidget {
  const SortByCheck({super.key});

  @override
  State<SortByCheck> createState() => _SortByCheckState();
}

class _SortByCheckState extends State<SortByCheck> {
  bool toprated = false;
  bool nearme = false;
  bool costhightolow = false;
  bool costLowtoHigh = false;
  bool mostPopular = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SortByCheckList(
          text: 'Top Rated',
          isActive: toprated,
          onPressed: () {
            setState(() {
              toprated = !toprated;
            });
          },
        ),
        SortByCheckList(
          text: 'Nearest Me',
          isActive: nearme,
          onPressed: () {
            setState(() {
              nearme = !nearme;
            });
          },
        ),
        SortByCheckList(
          text: 'Cost High to Low',
          isActive: costhightolow,
          onPressed: () {
            setState(() {
              costhightolow = !costhightolow;
            });
          },
        ),
        SortByCheckList(
          text: 'Cost Low to High',
          isActive: costLowtoHigh,
          onPressed: () {
            setState(() {
              costLowtoHigh = !costLowtoHigh;
            });
          },
        ),
        SortByCheckList(
          text: 'Most Popular',
          isActive: mostPopular,
          onPressed: () {
            setState(() {
              mostPopular = !mostPopular;
            });
          },
        ),
      ],
    );
  }
}

class SortByCheckList extends StatelessWidget {
  final Function()? onPressed;
  final bool isActive;
  final String text;
  const SortByCheckList({
    super.key,
    this.onPressed,
    required this.isActive,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Container(
        height: height * .055,
        alignment: Alignment.bottomLeft,
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
          color: isActive ? orange : Colors.grey,
        ))),
        child: ListTile(
          onTap: onPressed,
          title: Header(
            text: text,
            style: styles(fontSize: 14, color: isActive ? orange : Colors.grey),
          ),
          trailing: isActive
              ? const Icon(
                  Icons.check,
                  color: Color(0xFFFF6E40),
                )
              : const SizedBox.shrink(),
        ),
      ),
    );
  }
}
