
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:uuid/uuid.dart';

class MessageController extends ChangeNotifier {
  Uuid uuid = const Uuid();
  List<Message> messageList = [];

  void sendMessage(String text) {
    final message =
        TextMessage(author: const User(id: 'me'), id: uuid.v4(), text: text);
    if (messageList.isNotEmpty && messageList[0] is ImageMessage) {
      messageList.replaceRange(0, 1, [message]);
    } else {
      messageList.insert(0, message);
    }
    notifyListeners();
    setTyping();
  }

  setTyping()  {
    final message = TextMessage(
        author: const User(id: 'esosa'), id: uuid.v4(), text: 'typing...');
    messageList.insert(0, message);
    notifyListeners();
  }
}
