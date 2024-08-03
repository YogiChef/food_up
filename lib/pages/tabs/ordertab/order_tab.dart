import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_on/services/service.dart';
import 'package:move_on/pages/tabs/ordertab/empty_order.dart';
import 'package:move_on/widgets/heading.dart';

class OrderTab extends StatefulWidget {
  const OrderTab({super.key});

  @override
  State<OrderTab> createState() => _OrderTabState();
}

const emptyOrder = false;

class _OrderTabState extends State<OrderTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: emptyOrder
          ? const EmptyOrder()
          : CustomScrollView(
              slivers: [
                SliverAppBar(
                  elevation: 0.5,
                  leading: const Text(''),
                  title: Header(
                    text: 'My Order',
                    style: styles(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  centerTitle: true,
                ),
                SliverList(
                    delegate: SliverChildListDelegate([
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 12.w),
                              margin: EdgeInsets.only(top: 12.h),
                              width: width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.blueGrey,
                                      spreadRadius: 1,
                                      blurRadius: 4,
                                    )
                                  ]),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 12.w),
                                        margin: EdgeInsets.only(left: 12.w),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              alignment: Alignment.center,
                                              child: Header(
                                                text:
                                                    'Little Creatures - Club Street',
                                                textAlign: TextAlign.center,
                                                style: styles(
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.location_on,
                                                  color: Colors.grey,
                                                  size: 16.r,
                                                ),
                                                Text(
                                                  '89 Botsford Circle Apt',
                                                  style: styles(
                                                    fontSize: 12.sp,
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 12.w,
                                                ),
                                                GestureDetector(
                                                  onTap: () {},
                                                  child: Container(
                                                      height: 25.h,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 10.w,
                                                              vertical: 3.h),
                                                      alignment:
                                                          Alignment.center,
                                                      decoration: BoxDecoration(
                                                          color: orange,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                      child: Text(
                                                        'Free Delivery',
                                                        style: styles(
                                                            fontSize: 11.sp,
                                                            color:
                                                                Colors.white),
                                                      )),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      _items('Special Gajananad bhel',
                                          'Mixed vegetables.', '฿ 234'),
                                      _items('Cold Bournvita', 'Extra Hot Mild',
                                          '฿ 45'),
                                      _items('Butter Jam Maska Bun',
                                          'Mixed vegetables.', '฿ 234')
                                    ],
                                  ),
                                  ListTile(
                                    title: Header(
                                      text: 'Add more items',
                                      style: styles(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: orange),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ])),
              ],
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: emptyOrder
          ? const SizedBox.shrink()
          : Container(
              padding: EdgeInsets.symmetric(
                horizontal: 12.w,
              ),
              width: width,
              decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  color: Colors.blueGrey,
                  spreadRadius: 1,
                  blurRadius: 4,
                )
              ]),
              child: Padding(
                padding: EdgeInsets.only(bottom: 10.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _itemCheckOut('Subtotal', '฿3453'),
                    _itemCheckOut('Tax & Fees', '฿53'),
                    _itemCheckOut('Delivery', 'Free'),
                    Container(
                      margin: EdgeInsets.only(top: 12.h),
                      width: width * 0.85,
                      height: 40.h,
                      child: FloatingActionButton.extended(
                        backgroundColor: orange,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        onPressed: () {},
                        label: Text(
                          'Continue       ${'Total: 2345 ฿'}',
                          style: styles(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  _itemCheckOut(String text, String value) {
    return Container(
      margin: EdgeInsets.only(bottom: 4.h),
      height: 35.h,
      child: ListTile(
        title: Text(
          text,
          style: styles(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        trailing: Text(
          value,
          style: styles(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  _items(String title, String subtitle, String price) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey))),
      child: ListTile(
          title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: styles(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          Row(
            children: [
              Text(
                subtitle,
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
                style: styles(
                  fontSize: 13.sp,
                  color: Colors.grey,
                ),
              ),
              const Spacer(),
              Text(
                price,
                style: styles(
                  fontSize: 13.sp,
                  color: Colors.grey,
                ),
              ),
            ],
          )
        ],
      )),
    );
  }
}
