import 'package:comments_assessment_app/constants/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  final String text;
  final TextEditingController textEditingController;
  final bool isObscure;

  const CustomTextFormField({
    super.key,
    required this.text,
    required this.textEditingController,
    this.isObscure = false,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          color: GlobalVariables.kWhite,
          borderRadius: BorderRadius.circular(20.r)),
      child: TextFormField(
        controller: textEditingController,
        obscureText: isObscure,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 20.w),
          hintStyle: GlobalVariables.kLightTextStyle.copyWith(
            fontSize: 14.sp,
          ),
          hintText: text,
          border: InputBorder.none,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Enter $text';
          }
          return null;
        },
      ),
    );
  }
}
