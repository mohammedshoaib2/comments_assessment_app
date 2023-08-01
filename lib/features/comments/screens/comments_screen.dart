// ignore_for_file: use_build_context_synchronously

import 'package:comments_assessment_app/constants/utils.dart';
import 'package:comments_assessment_app/features/auth/screens/auth_screen.dart';
import 'package:comments_assessment_app/features/comments/services/firebase_remoteconfig_services.dart';
import 'package:comments_assessment_app/features/comments/widgets/custom_detail_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:comments_assessment_app/constants/global_variables.dart';
import 'package:comments_assessment_app/providers/comment_provider.dart';

class CommentsScreen extends StatefulWidget {
  const CommentsScreen({super.key});

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  FireBaseRemoteConfigServices fireBaseRemoteConfigServices =
      FireBaseRemoteConfigServices();
  void logOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) {
      return const AuthScreen();
    }), (route) => false);
  }

  @override
  void initState() {
    super.initState();

    fireBaseRemoteConfigServices.initializeConfig(context: context);
  }

  @override
  Widget build(BuildContext context) {
    final commentList = Provider.of<CommentProvider>(context).getVal;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalVariables.kPrimaryColor,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: logOut,
            icon: const Icon(Icons.logout),
          )
        ],
        title: Text(
          'Comments',
          style: GlobalVariables.kBoldTextStyle.copyWith(
            color: GlobalVariables.kWhite,
            fontSize: 16.sp,
          ),
        ),
      ),
      body: commentList.isNotEmpty
          ? Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                clipBehavior: Clip.none,
                itemCount: commentList.length,
                itemBuilder: (context, index) {
                  return CustomDetailCard(
                    comment: commentList[index],
                  );
                },
              ),
            )
          : showShimmerLoading(context: context),
    );
  }
}
