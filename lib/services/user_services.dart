import 'package:shared_preferences/shared_preferences.dart';

class UserServices {
  Future<bool> isNewUser() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('name');
  }

  Future<void> setUsername(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', name);
  }

  Future<String> getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('name')!;
  }
}
