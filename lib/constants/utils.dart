// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

const url = 'https://jsonplaceholder.typicode.com/comments';
void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}

String obscureEmail(String email) {
  String obscuredEmail = '';
  int indexofat = email.indexOf('@');
  String domain = email.substring(indexofat, email.characters.length);
  String username = email.substring(0, indexofat);
  int leftOutChars = username.characters.length - 3;
  String obscuredText = '*' * leftOutChars;
  obscuredEmail =
      (username.characters.length <= 3 ? '***' : username.substring(0, 3)) +
          obscuredText +
          domain;

  return obscuredEmail;
}

Widget showShimmerLoading({required BuildContext context}) {
  return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
        child: ListView.builder(
            clipBehavior: Clip.none,
            physics: const BouncingScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.symmetric(vertical: 5.h),
                child: SizedBox(height: 150.h),
              );
            }),
      ));
}
