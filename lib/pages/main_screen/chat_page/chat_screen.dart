import 'dart:async';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nabgh_app/constatns/app_constants.dart';
import 'package:nabgh_app/widget/app_back_button.dart';

import '../../../model/chat_model.dart';
import '../../../widget/code_display_widget.dart';
import '../../../widget/user_profile.dart';

class ChatPage extends StatefulWidget {
  static const routeName = "chat-page";

  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
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

  onMessageSend({required String message}) async {
    controller.clear();
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
            icon: SvgPicture.asset("assets/icon/send.svg"),
            color: Theme.of(context).primaryColor,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          filled: true,
          hintStyle: TextStyle(color: Colors.white60),
          hintText: "Write anything...",
          fillColor: Colors.transparent,
        ),
      ),
    );
  }

  buildAppBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0)
          .copyWith(bottom: 10, top: 4),
      child: Row(
        children: [
          AppBackButton(),
          Spacer(),
          Text(
            "Coding",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
          ),
          Spacer(),
          UserProfile(),
        ],
      ),
    );
  }

  buildChatTitle() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Color(0xff3B3B3B),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset("assets/discover/code.svg"),
          SizedBox(
            width: 12,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Code",
                style:
                    TextStyle(fontSize: 16, color: AppConstants.secondaryColor),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
                style: TextStyle(color: Colors.white70, fontSize: 14),
              )
            ],
          ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    buildBotChatTile({required UserChatModel chat}) {
      return Container(
        padding: EdgeInsets.only(bottom: 18),
        constraints: BoxConstraints(maxWidth: width * .7),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              "assets/icon/brain.svg",
              height: 25,
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
                child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(18),
                    bottomLeft: Radius.circular(18),
                    bottomRight: Radius.circular(18),
                  ),
                  border: Border.all(color: Color(0xff575757))),
              child: Text(
                chat.message,
                style: TextStyle(
                    fontSize: 14, color: Colors.white.withOpacity(.8)),
              ),
            ))
          ],
        ),
      );
    }

    buildUserChatTile({required UserChatModel chat}) {
      return Container(
        padding: EdgeInsets.only(bottom: 18),
        width: double.infinity,
        child: Row(
          children: [
            Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                gradient: AppConstants.gradient,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(18),
                  topLeft: Radius.circular(18),
                  bottomLeft: Radius.circular(18),
                ),
              ),
              // width: width * .7,
              constraints: BoxConstraints(maxWidth: width * .7),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    chat.message,
                    style: TextStyle(color: Colors.black),
                  )
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
        backgroundColor: Colors.black,
        bottomNavigationBar: buildSearchBar(),
        body: SafeArea(
          child: Column(
            children: [
              buildAppBar(),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * .06),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 8,
                        ),
                        buildChatTitle(),
                        SizedBox(
                          height: 18,
                        ),
                        ...chatList.map((chat) {
                          if (chat.chatType == ChatType.text) {
                            if (chat.isUser) {
                              return buildUserChatTile(chat: chat);
                            } else {
                              return buildBotChatTile(chat: chat);
                            }
                          }

                          if (chat.chatType == ChatType.code) {
                            return CodeDisplayWidget(code: chat.message);
                          }

                          return Container();
                        }).toList(),
                        SizedBox(
                          height: 28,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
