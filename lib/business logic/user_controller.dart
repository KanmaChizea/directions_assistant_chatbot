import 'package:esosa/data/user_services.dart';
import 'package:flutter/cupertino.dart';

class UserController extends ChangeNotifier {
  UserController(UserServices services) : _services = services;

  final UserServices _services;
  String username = '';

  void setUsername(String name) async {
    await _services.setUsername(name);
    username = name;
    notifyListeners();
  }

  void getUsername() async {
    username = await _services.getUsername();
    notifyListeners();
  }
}
