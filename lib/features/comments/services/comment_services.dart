// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:comments_assessment_app/constants/http_response_handler.dart';
import 'package:comments_assessment_app/constants/utils.dart';
import 'package:comments_assessment_app/models/comment.dart';
import 'package:comments_assessment_app/providers/comment_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class CommentServices {
  Future<void> fetchComments({required BuildContext context}) async {
    try {
      http.Response response = await http.get(Uri.parse(url));
      httpResponseHandler(
          context: context,
          response: response,
          onSuccess: () {
            List list = jsonDecode(response.body);

            List<Comment> a = List<Comment>.from(
                list.map((e) => Comment.fromJson(jsonEncode(e))).toList());
            Provider.of<CommentProvider>(context, listen: false)
                .insertIntoListOfComments(a);
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
