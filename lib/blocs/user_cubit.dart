import 'package:esosa/services/user_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserStatusCubit extends Cubit<bool> {
  UserStatusCubit(UserServices services)
      : _services = services,
        super(false);

  final UserServices _services;

  void isNewUser() async {
    final isNew = await _services.isNewUser();
    emit(isNew);
  }
}

class UserCubit extends Cubit<String> {
  UserCubit(UserServices services)
      : _services = services,
        super('');

  final UserServices _services;

  void setUsername(String name) async {
    await _services.setUsername(name);
    emit(name);
  }

  void getUsername() async {
    final name = await _services.getUsername();
    emit(name);
  }
}
