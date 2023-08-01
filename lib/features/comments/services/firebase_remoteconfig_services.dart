// ignore_for_file: prefer_conditional_assignment, use_build_context_synchronously

import 'package:comments_assessment_app/features/comments/services/comment_services.dart';
import 'package:comments_assessment_app/providers/remote_config_provider.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FireBaseRemoteConfigServices {
  FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
  CommentServices commentServices = CommentServices();

  Future<void> initializeConfig({required BuildContext context}) async {
    try {
      await remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(
            seconds: 1,
          ),
          minimumFetchInterval: const Duration(
            seconds: 1,
          ),
        ),
      );
      await remoteConfig.fetchAndActivate();

      bool obscureText = remoteConfig.getBool('obscureText');

      Provider.of<RemoteConfigProvider>(context, listen: false)
          .updateSecurity(obscureText);
      await commentServices.fetchComments(context: context);
    } catch (e) {
      await commentServices.fetchComments(context: context);
    }
  }
}
