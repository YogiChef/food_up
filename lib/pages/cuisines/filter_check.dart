import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_on/services/service.dart';
import 'package:move_on/widgets/heading.dart';

class FilterCheck extends StatefulWidget {
  const FilterCheck({super.key});

  @override
  State<FilterCheck> createState() => _FilterCheckState();
}

class _FilterCheckState extends State<FilterCheck> {
  bool openNow = false;
  bool creditCards = false;
  bool alcoholServed = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SortByCheckList(
          text: 'Open Now',
          isActive: openNow,
          onPressed: () {
            setState(() {
              openNow = !openNow;
            });
          },
        ),
        SortByCheckList(
          text: 'Credit Cards',
          isActive: creditCards,
          onPressed: () {
            setState(() {
              creditCards = !creditCards;
            });
          },
        ),
        SortByCheckList(
          text: 'Alcohol Served',
          isActive: alcoholServed,
          onPressed: () {
            setState(() {
              alcoholServed = !alcoholServed;
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
                bottom: BorderSide(color: isActive ? orange : Colors.grey))),
        child: ListTile(
          onTap: onPressed,
          title: Header(
            text: text,
            style: styles(fontSize: 14, color: isActive ? orange : Colors.grey),
          ),
          trailing: isActive
              ? const Icon(
                  Icons.check,
                  color: orange,
                )
              : const SizedBox.shrink(),
        ),
      ),
    );
  }
}
