import 'package:comments_assessment_app/constants/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

void httpResponseHandler(
    {required BuildContext context,
    required Response response,
    required VoidCallback onSuccess}) {
  if (response.statusCode == 200) {
    onSuccess();
  } else {
    showSnackBar(context, response.body);
  }
}
