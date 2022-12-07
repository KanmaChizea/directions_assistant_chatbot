import 'package:esosa/presentation/styles/space.dart';
import 'package:esosa/presentation/styles/text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../business logic/message_controller.dart';
import '../../business logic/user_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset('asset/avi.png'),
                  space8,
                  const Text('Esosa', style: h3Medium)
                ],
              ),
              Flexible(flex: 2, child: Container()),
              Text('Welcome ${context.watch<UserController>().username}',
                  style: h1Bold),
              space16,
              const Text('It\'s a good day to go out on the streets of benin',
                  style: bodyRegular),
              space64,
              space64,
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                    onPressed: () {
                      context.read<MessageController>().initializeChat();
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil('chat', (route) => false);
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text('Continue to directions'),
                        space8,
                        Icon(Icons.arrow_forward_ios)
                      ],
                    )),
              ),
              Flexible(flex: 3, child: Container()),
            ],
          ),
        ),
      ),
    );
  }
}
