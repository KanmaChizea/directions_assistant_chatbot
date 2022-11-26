import 'package:esosa/blocs/themes_cubit.dart';
import 'package:esosa/blocs/user_cubit.dart';
import 'package:esosa/screens/chat.dart';
import 'package:esosa/screens/home.dart';
import 'package:esosa/screens/user.dart';
import 'package:esosa/services/user_services.dart';
import 'package:esosa/styles/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [RepositoryProvider(create: (context) => UserServices())],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ThemeCubit()),
          BlocProvider(
              create: (context) =>
                  UserStatusCubit(RepositoryProvider.of<UserServices>(context))
                    ..isNewUser()),
          BlocProvider(
              create: (context) =>
                  UserCubit(RepositoryProvider.of<UserServices>(context)))
        ],
        child: Builder(builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: context.watch<ThemeCubit>().state,
            routes: {
              'home': (context) => const HomeScreen(),
              'chat': (context) => const ChatScreen()
            },
            home: BlocBuilder<UserStatusCubit, bool>(builder: (context, state) {
              if (state) {
                return const HomeScreen();
              } else {
                return const UserData();
              }
            }),
          );
        }),
      ),
    );
  }
}
