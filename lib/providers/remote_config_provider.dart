import 'package:flutter/material.dart';

class RemoteConfigProvider extends ChangeNotifier {
  bool _isObscureText = false;
  bool get isObscureText => _isObscureText;

  void updateSecurity(bool val) {
    _isObscureText = val;
    notifyListeners();
  }
}
