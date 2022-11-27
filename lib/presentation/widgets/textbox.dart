import 'package:esosa/business%20logic/message_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../styles/colors.dart';
import '../styles/space.dart';
import '../styles/text.dart';

class BottomTextBox extends StatefulWidget {
  const BottomTextBox({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomTextBox> createState() => _BottomTextBoxState();
}

class _BottomTextBoxState extends State<BottomTextBox> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
            style: bodyRegular,
            cursorColor: primary,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: 'Write your message...',
              hintStyle: bodyRegular.copyWith(color: Colors.grey.shade600),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none),
            ),
          ),
        ),
        space8,
        SizedBox(
          height: 40,
          width: 40,
          child: FloatingActionButton(
            elevation: 5,
            backgroundColor: primary,
            onPressed: () {
              if (_controller.text.isNotEmpty) {
                context.read<MessageController>().sendMessage(_controller.text);
                _controller.clear();
              }
            },
            child: const Icon(Icons.send),
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
