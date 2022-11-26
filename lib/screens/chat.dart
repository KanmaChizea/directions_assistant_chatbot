import 'package:esosa/blocs/themes_cubit.dart';
import 'package:esosa/styles/colors.dart';
import 'package:esosa/widgets/change_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/change_name.dart';
import '../widgets/textbox.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, state) => Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage((MediaQuery.of(context).platformBrightness ==
                        Brightness.light)
                    ? 'asset/bg_light.png'
                    : 'asset/bg_dark.png'),
                fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: primary,
            leading: Image.asset('asset/avi.png'),
            title: const Text('Esosa'),
            actions: [
              PopupMenuButton(
                  icon: const Icon(Icons.settings),
                  itemBuilder: (context) => [
                        PopupMenuItem(
                          child: const Text('Change name'),
                          onTap: () {
                            Future.delayed(
                              Duration.zero,
                              () => showDialog(
                                  context: context,
                                  builder: (context) =>
                                      const ChangeNameDialog()),
                            );
                          },
                        ),
                        PopupMenuItem(
                            child: const Text('Change theme'),
                            onTap: () => Future.delayed(
                                  Duration.zero,
                                  () => showDialog(
                                      context: context,
                                      builder: (context) =>
                                          const ChangeThemeDialog()),
                                )),
                      ])
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: BottomTextBox(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
