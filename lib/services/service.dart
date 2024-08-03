import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

double height = 825.h;
double width = 375.w;

styles({
  double? letterSpacing,
  required double fontSize,
  double? height,
  FontWeight? fontWeight = FontWeight.w400,
  Color? color = Colors.black54,
}) {
  return GoogleFonts.josefinSans(
    height: height,
    letterSpacing: letterSpacing,
    fontSize: fontSize.sp,
    fontWeight: fontWeight,
    color: color,
  );
}

textstyles({
  double? letterSpacing,
  required double fontSize,
  double? height,
  FontWeight? fontWeight = FontWeight.w400,
  Color? color = Colors.black87,
}) {
  return TextStyle(
    height: height,
    letterSpacing: letterSpacing,
    fontSize: fontSize.sp,
    fontWeight: fontWeight,
    color: color,
  );
}

const Color orange = Color(0xFFFF6E40);
