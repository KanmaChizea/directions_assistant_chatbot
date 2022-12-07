import 'package:dialogflow_flutter/dialogflowFlutter.dart';
import 'package:dialogflow_flutter/googleAuth.dart';

class ChatbotService {
  Future<String?> getResponse(String query) async {
    AuthGoogle authGoogle =
        await AuthGoogle(fileJson: 'credentials.json').build();
    DialogFlow dialogflow = DialogFlow(authGoogle: authGoogle);
    AIResponse aiResponse = await dialogflow.detectIntent(query);
    return aiResponse.getMessage();
  }
}
