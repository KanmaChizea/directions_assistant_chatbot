import 'package:esosa/data/user_services.dart';
import 'package:flutter/cupertino.dart';

class UserStatusController extends ChangeNotifier {
  UserStatusController(UserServices services) : _services = services;

  final UserServices _services;
  bool userStatus = false;

  void isNewUser() async {
    userStatus = await _services.isNewUser();
    notifyListeners();
  }
}
