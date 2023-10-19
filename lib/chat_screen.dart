import 'dart:async';

import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  String apiKey = "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";
  TextEditingController controller = TextEditingController();
  StreamSubscription? streamSubscription;
  late OpenAI? chatGPT;

  @override
  void initState() {
    chatGPT = OpenAI.instance.build(
        token: apiKey,
        orgId: "org-U5Im73fm82X69ZQe2bQgilGN",
        baseOption: HttpSetup(receiveTimeout: Duration(seconds: 5)));
    super.initState();
  }

  @override
  void dispose() {
    streamSubscription?.cancel();
    super.dispose();
  }

  List<String> chatList = ["hello", "how are you"];

  onMessageSend({required String message}) async {
     if (message.isEmpty) {
      return;
    }
    chatList.insert(0, message);
    controller.clear();
    setState(() {});

    final request = CompleteText(
        prompt: translateEngToThai(word: message.toString()),
        maxTokens: 200,
        model: TextDavinci3Model());

    final response = await chatGPT!.onCompletion(request: request);

    print(response);
  }

  buildSearchBar() {
    return Container(
      height: 55,
      margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 10),
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: TextField(
        controller: controller,
        onSubmitted: (message) => onMessageSend(message: message),
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () {
              onMessageSend(message: controller.text);
            },
            icon: Icon(
              Icons.send,
            ),
            color: Theme.of(context).primaryColor,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          filled: true,
          hintStyle: TextStyle(color: Colors.white60),
          hintText: "Type in your text",
          fillColor: Colors.transparent,
        ),
      ),
    );
  }

  buildChatCard({required String message}) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(message[0].toUpperCase()),
      ),
      title: Text(
        "User",
        style: TextStyle(color: Colors.white70),
      ),
      subtitle: Text(
        message,
        style: TextStyle(color: Colors.white70),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        bottomNavigationBar: buildSearchBar(),
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Chat screen",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: ListView.builder(
            padding: EdgeInsets.only(bottom: 12),
            itemCount: chatList.length,
            reverse: true,
            itemBuilder: (context, index) {
              return buildChatCard(message: chatList[index]);
            }));
  }
}
