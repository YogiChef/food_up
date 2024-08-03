import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_on/services/service.dart';

class SearchTopbar extends StatelessWidget {
  const SearchTopbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, 'search'),
      child: Row(
        children: [
          Container(
            width: width * 0.8,
            margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.grey, width: 0.5)),
            child: Row(
              children: [
                Icon(
                  Icons.search,
                  size: 20.r,
                  color: Colors.grey,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5.w),
                  child: Text(
                    'Search',
                    style: styles(fontSize: 14, color: Colors.grey),
                  ),
                )
              ],
            ),
          ),
          CircleAvatar(
            radius: 20.r,
            backgroundColor: Colors.grey.shade200,
            child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'filter');
                },
                icon: Icon(
                  Icons.filter_list,
                  size: 24.r,
                  color: orange,
                )),
          ),
        ],
      ),
    );
  }
}
