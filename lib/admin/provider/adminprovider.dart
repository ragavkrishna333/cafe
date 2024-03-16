import 'package:flutter/material.dart';

class AdminProvider extends ChangeNotifier {
  bool mobVerified = false;
  TextEditingController mobileController = TextEditingController();
  bool emailVerified = false;
  mobverify(bool value) {
    mobVerified = value;
    notifyListeners();
  }

  emailverify(bool value) {
    emailVerified = value;
    notifyListeners();
  }
}
