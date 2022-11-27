import 'package:esosa/presentation/styles/space.dart';
import 'package:esosa/presentation/styles/text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../business logic/user_controller.dart';

class ChangeNameDialog extends StatefulWidget {
  const ChangeNameDialog({Key? key}) : super(key: key);

  @override
  State<ChangeNameDialog> createState() => _ChangeNameDialogState();
}

class _ChangeNameDialogState extends State<ChangeNameDialog> {
  late TextEditingController _controller;
  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Enter new name', style: h3Medium),
          space16,
          TextField(
            controller: _controller,
            style: bodyMedium,
          ),
          space16,
          Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                  onPressed: () {
                    if (_controller.text.isNotEmpty) {
                      context.read()<UserController>().setUsername(
                          _controller.text.replaceRange(
                              0, 1, _controller.text[0].toUpperCase()));
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Save')))
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
