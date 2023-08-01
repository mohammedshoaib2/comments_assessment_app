import 'package:comments_assessment_app/constants/global_variables.dart';
import 'package:comments_assessment_app/constants/utils.dart';
import 'package:comments_assessment_app/features/comments/widgets/custom_text_label.dart';
import 'package:comments_assessment_app/models/comment.dart';
import 'package:comments_assessment_app/providers/remote_config_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CustomDetailCard extends StatelessWidget {
  final Comment comment;

  const CustomDetailCard({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 7.h),
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
          color: GlobalVariables.kWhite,
          borderRadius: BorderRadius.circular(
            10.r,
          )),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        CircleAvatar(
          backgroundColor: GlobalVariables.kGreyColor,
          radius: 25.r,
          child: Text(
            comment.email.characters.first,
            style: GlobalVariables.kBoldTextStyle.copyWith(
              fontSize: 16.sp,
              color: GlobalVariables.kBlack,
            ),
          ),
        ),
        SizedBox(
          width: 5.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextLabel(
              leading: 'Name',
              trailing: comment.name,
            ),
            SizedBox(
              height: 5.h,
            ),
            CustomTextLabel(
                leading: 'Email',
                trailing:
                    Provider.of<RemoteConfigProvider>(context).isObscureText
                        ? obscureEmail(comment.email)
                        : comment.email),
            SizedBox(
              height: 5.h,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .65,
              child: Text(
                comment.body,
                style: GlobalVariables.kLightTextStyle,
              ),
            ),
          ],
        )
      ]),
    );
  }
}
