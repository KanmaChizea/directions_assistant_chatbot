import 'package:esosa/styles/space.dart';
import 'package:esosa/styles/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/themes_cubit.dart';

class ChangeThemeDialog extends StatefulWidget {
  const ChangeThemeDialog({Key? key}) : super(key: key);

  @override
  State<ChangeThemeDialog> createState() => _ChangeThemeDialogState();
}

class _ChangeThemeDialogState extends State<ChangeThemeDialog> {
  int groupValue = 1;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Select theme', style: h3Medium),
          space16,
          RadioListTile(
            value: 1,
            groupValue: groupValue,
            onChanged: (value) {
              setState(() {
                groupValue = value!;
              });
              context.read<ThemeCubit>().changeTheme(value!);
            },
            title: const Text('Light theme', style: bodyRegular),
            contentPadding: const EdgeInsets.symmetric(horizontal: 0),
          ),
          RadioListTile(
            value: 2,
            groupValue: groupValue,
            onChanged: (value) {
              setState(() {
                groupValue = value!;
              });
              context.read<ThemeCubit>().changeTheme(value!);
            },
            title: const Text('Dark theme', style: bodyRegular),
            contentPadding: const EdgeInsets.symmetric(horizontal: 0),
          ),
          RadioListTile(
            value: 3,
            groupValue: groupValue,
            onChanged: (value) {
              setState(() {
                groupValue = value!;
              });
              context.read<ThemeCubit>().changeTheme(value!);
            },
            title: const Text('Use system default', style: bodyRegular),
            contentPadding: const EdgeInsets.symmetric(horizontal: 0),
          ),
        ],
      ),
    );
  }
}
