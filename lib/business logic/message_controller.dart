import 'package:esosa/data/chatbot_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:uuid/uuid.dart';

class MessageController extends ChangeNotifier {
  MessageController(ChatbotService service) : _service = service;

  ChatbotService _service;

  Uuid uuid = const Uuid();
  User esosa = const User(id: 'esosa');
  User user = const User(id: 'me');
  List<Message> messageList = [];

  void initializeChat() {
    var message =
        TextMessage(author: esosa, id: uuid.v4(), text: "Hello, I'm Esosa");
    messageList.insert(0, message);
    notifyListeners();
    message = TextMessage(
        author: esosa,
        id: uuid.v4(),
        text:
            "What's your starting location?");
    messageList.insert(0, message);
    notifyListeners();
  }

  Future<void> sendMessage(String text) async {
    final message = TextMessage(author: user, id: uuid.v4(), text: text);
    if (messageList.isNotEmpty && messageList[0] is ImageMessage) {
      messageList.replaceRange(0, 1, [message]);
    } else {
      messageList.insert(0, message);
    }
    notifyListeners();
    setTyping();
    await receiveMessage(text);
  }

  void setTyping() {
    final message =
        TextMessage(author: esosa, id: uuid.v4(), text: 'typing...');
    messageList.insert(0, message);
    notifyListeners();
  }

  Future<void> receiveMessage(String text) async {
    bool resetContext = text.toLowerCase() == 'yes' || text.toLowerCase() == 'yeah'; 
    final response = await _service.getResponse(text,resetContext);
    final message = TextMessage(
        author: esosa,
        id: uuid.v4(),
        text: response ?? 'Sorry, please ask your question again');
    messageList[0] = message;
    notifyListeners();
    if (response!.length > 40){
      messageList.insert(0, TextMessage(
        author: esosa,
        id: uuid.v4(),
        text: 'Can i help you with anything else?'));
    }
  }

}
