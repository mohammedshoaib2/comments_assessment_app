import 'package:comments_assessment_app/constants/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircularLoader extends StatelessWidget {
  const CircularLoader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25.h,
      width: 25.h,
      child: const CircularProgressIndicator(
        strokeWidth: 2.8,
        color: GlobalVariables.kWhite,
      ),
    );
  }
}
