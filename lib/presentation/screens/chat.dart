import 'package:esosa/business%20logic/message_controller.dart';
import 'package:esosa/presentation/styles/colors.dart' as color;
import 'package:esosa/presentation/styles/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:provider/provider.dart';

import '../widgets/change_name.dart';
import '../widgets/textbox.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('asset/bg_light.png'), fit: BoxFit.cover)),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: color.primary,
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
                      ])
            ],
          ),
          body: Chat(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
              customBottomWidget: const Padding(
                padding: EdgeInsets.all(16.0),
                child: BottomTextBox(),
              ),
              messages: Provider.of<MessageController>(context).messageList,
              onSendPressed: (text) {},
              user: const types.User(id: 'me'),
              theme: const DefaultChatTheme(
                  primaryColor: color.secondary,
                  secondaryColor: color.secondary1,
                  backgroundColor: Colors.transparent,
                  sentMessageBodyTextStyle: bodyRegular,
                  receivedMessageBodyTextStyle: bodyRegular,
                  messageInsetsVertical: 8))),
    );
  }
}
