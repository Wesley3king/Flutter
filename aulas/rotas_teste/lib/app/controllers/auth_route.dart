import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier {
  static bool isAuth = false;

  login() {
    isAuth = true;
    notifyListeners();
  }

  logout() {
    isAuth = false;
    notifyListeners();
  }
}
