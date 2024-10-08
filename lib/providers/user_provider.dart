import 'package:flutter/material.dart';
import 'package:instagram_clone/resources/auth_method.dart';
import '../model/user.dart';

class UserProvider extends ChangeNotifier {

   User ? _user;
   final AuthMethods _authMethods = AuthMethods();
  User get getUser => _user!;


  Future<void> refreshUser() async {
    try {
      User user = await _authMethods.getUserDetail();
      _user = user;
      print(_user);

      notifyListeners();
      print("Hoiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii");
    } catch (e) {
      // Handle errors (e.g., log them or set _user to a default value)
      print("Error refreshing user: $e");
    }
  }
}
