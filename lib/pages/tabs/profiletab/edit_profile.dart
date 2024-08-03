import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_on/services/service.dart';
import 'package:move_on/widgets/heading.dart';
import 'package:move_on/widgets/input_textfield.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Edit Profile',
          style: styles(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              size: 20.r,
            )),
        elevation: 0.4,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: GestureDetector(
              onTap: () {},
              child: Header(
                text: 'Done',
                style: styles(
                    fontSize: 16, fontWeight: FontWeight.w700, color: orange),
              ),
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.blueGrey,
                        offset: Offset(0, 5),
                        blurRadius: 10)
                  ]),
              margin: EdgeInsets.only(top: 100.h, left: 15.w, right: 15.w),
              height: height * .6,
              width: width,
              child: Transform.translate(
                offset: const Offset(0, -60),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 65.r,
                        backgroundColor: Colors.grey.shade300,
                        child: CircleAvatar(
                          radius: 60.r,
                          backgroundImage: const NetworkImage(
                              'https://newprofilepic.photo-cdn.net//assets/images/article/profile.jpg?90af0c8'),
                        ),
                      ),
                      Transform.translate(
                        offset: const Offset(40, -40),
                        child: CircleAvatar(
                          radius: 18.r,
                          backgroundColor: Colors.amber,
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                                size: 20.r,
                              )),
                        ),
                      ),
                      InputTextfield(
                        textInputType: TextInputType.text,
                        prefixIcon: const Icon(
                          Icons.account_box_rounded,
                          color: Colors.red,
                        ),
                        hintText: 'User Name',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Plaese Enter your name';
                          } else {
                            return null;
                          }
                        },
                      ),
                      InputTextfield(
                        textInputType: TextInputType.text,
                        prefixIcon: const Icon(
                          Icons.email_outlined,
                          color: Colors.cyan,
                        ),
                        hintText: 'Email',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email addres';
                          } else if (value.isValidEmail() == false) {
                            return 'invalid email';
                          } else if (value.isValidEmail() == true) {
                            return null;
                          } else {
                            return null;
                          }
                        },
                      ),
                      InputTextfield(
                        textInputType: TextInputType.text,
                        prefixIcon: Icon(
                          Icons.phone_android_outlined,
                          color: Colors.blue.shade900,
                        ),
                        hintText: 'Phone',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Plaese Enter your Phone';
                          } else {
                            return null;
                          }
                        },
                      ),
                      InputTextfield(
                        textInputType: TextInputType.text,
                        prefixIcon: const Icon(
                          Icons.date_range_outlined,
                          color: Colors.purple,
                        ),
                        hintText: 'Date of birth',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Plaese Enter date of birth';
                          } else {
                            return null;
                          }
                        },
                      ),
                      InputTextfield(
                        textInputType: TextInputType.text,
                        prefixIcon: const Icon(
                          Icons.location_on_outlined,
                          color: Colors.green,
                        ),
                        hintText: 'Delivery Address',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Plaese Enter your Address';
                          } else {
                            return null;
                          }
                        },
                      )
                    ],
                  ),
                ),
              ),
            )
          ]))
        ],
      ),
    );
  }
}
