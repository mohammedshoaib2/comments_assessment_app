import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlobalVariables {
  static const kBackgroundColor = Color(0xFFF5F9FD);
  static const kPrimaryColor = Color(0xFF0C54BE);
  static const kGreyColor = Color(0xFFCED3DC);
  static const kDarkBlue = Color(0xFF303F60);
  static const kBlack = Color(0xFF000000);
  static const kWhite = Color(0xFFFFFFFF);

  static TextStyle kLightTextStyle = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 12.sp,
    color: kBlack,
    fontWeight: FontWeight.normal,
  );
  static TextStyle kSemiBoldTextStyle = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 12.sp,
    color: kBlack,
    fontWeight: FontWeight.w500,
  );
  static TextStyle kBoldTextStyle = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 12.sp,
    color: kPrimaryColor,
    fontWeight: FontWeight.bold,
  );
}
