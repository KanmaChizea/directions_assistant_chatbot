import 'package:esosa/blocs/user_cubit.dart';
import 'package:esosa/styles/space.dart';
import 'package:esosa/styles/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserData extends StatefulWidget {
  const UserData({Key? key}) : super(key: key);

  @override
  State<UserData> createState() => _UserDataState();
}

class _UserDataState extends State<UserData> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('asset/avi_96.png'),
            space16,
            const Text("Hi, I'm Esosa", style: h1Bold),
            space16,
            const Text("Your automated directions assistant for Benin",
                style: h2Medium),
            space16,
            const Text('Please enter your name', style: bodyRegular),
            space16,
            TextField(
              controller: _controller,
              style: bodyMedium,
            ),
            space24,
            Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                    onPressed: () {
                      if (_controller.text.isNotEmpty) {
                        context.read<UserCubit>().setUsername(_controller.text
                            .replaceRange(
                                0, 1, _controller.text[0].toUpperCase()));
                        Navigator.of(context)
                            .pushNamedAndRemoveUntil('home', (route) => false);
                      }
                    },
                    child: const Text('Next')))
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
