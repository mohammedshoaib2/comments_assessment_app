import 'package:comments_assessment_app/models/comment.dart';
import 'package:flutter/material.dart';

class CommentProvider extends ChangeNotifier {
  final List<Comment> _listOfComments = [];

  List<Comment> get getVal => _listOfComments;

  void insertIntoListOfComments(List<Comment> list) {
    _listOfComments.addAll(list);
    notifyListeners();
  }
}
