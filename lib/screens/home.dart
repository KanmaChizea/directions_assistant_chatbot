import 'package:esosa/styles/space.dart';
import 'package:esosa/styles/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/user_cubit.dart';

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
              Flexible(flex: 1, child: Container()),
              Text('Welcome ${context.read<UserCubit>().state}', style: h1Bold),
              space16,
              const Text('It\'s a good day to go out on the streets of benin',
                  style: bodyRegular),
              space64,
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                    onPressed: () => Navigator.of(context)
                        .pushNamedAndRemoveUntil('chat', (route) => false),
                    child: const Text('Continue to directions')),
              ),
              Flexible(flex: 2, child: Container()),
            ],
          ),
        ),
      ),
    );
  }
}
