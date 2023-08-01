import 'package:comments_assessment_app/constants/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextLabel extends StatelessWidget {
  final String leading;
  final String trailing;

  const CustomTextLabel({
    Key? key,
    required this.leading,
    required this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .65,
      child: Row(
        children: [
          Text(
            '$leading : ',
            style: GlobalVariables.kLightTextStyle.copyWith(
              color: GlobalVariables.kGreyColor,
              fontStyle: FontStyle.italic,
            ),
          ),
          Expanded(
            child: Text(
              trailing,
              style: GlobalVariables.kBoldTextStyle.copyWith(
                color: GlobalVariables.kBlack,
                fontSize: 12.sp,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
