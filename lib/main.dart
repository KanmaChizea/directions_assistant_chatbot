import 'package:esosa/business%20logic/message_controller.dart';
import 'package:esosa/business%20logic/user_controller.dart';
import 'package:esosa/presentation/screens/chat.dart';
import 'package:esosa/presentation/screens/home.dart';
import 'package:esosa/presentation/screens/user.dart';
import 'package:esosa/data/user_services.dart';
import 'package:esosa/presentation/styles/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'business logic/user_status_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final userServices = UserServices();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) =>
                UserStatusController(userServices)..isNewUser()),
        ChangeNotifierProvider(
            create: (context) => UserController(userServices)),
        ChangeNotifierProvider(create: (context) => MessageController())
      ],
      child: Builder(builder: (context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          routes: {
            'home': (context) => const HomeScreen(),
            'chat': (context) => const ChatScreen()
          },
          home: Builder(builder: (context) {
            final state = Provider.of<UserStatusController>(context).userStatus;
            if (state) {
              context.read<UserController>().getUsername();
              return const HomeScreen();
            } else {
              return const UserData();
            }
          }),
        );
      }),
    );
  }
}
