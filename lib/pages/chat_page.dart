import 'package:dash_chat_2/dash_chat_2.dart';
// import 'package:day9_flutter/gpt.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  ChatUser me = ChatUser(id: "1");
  ChatUser bot = ChatUser(id: "2");
  List<ChatMessage> messagesList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("reverse game"),
        centerTitle: true,
        backgroundColor: Colors.green[700],
      ),
      body: Container(
        color: const Color.fromARGB(255, 67, 88, 68),
        child: DashChat(
          currentUser: me,
          onSend: (newMessage) async {
            messagesList.insert(0, newMessage);
            setState(() {});
            String reversedContent =
                newMessage.text.split('').reversed.join('');
            ChatMessage botMessage = ChatMessage(
              user: bot,
              createdAt: DateTime.now(),
              text: reversedContent,
            );

            messagesList.insert(0, botMessage);
            setState(() {});
          },
          messages: messagesList,
          messageOptions: MessageOptions(
            currentUserTextColor: Colors.black,
            showCurrentUserAvatar: true,
            avatarBuilder: (p0, onPressAvatar, onLongPressAvatar) =>
                Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwS70r6aZEg6-wofSf66x7MU7FiZSEFSOIQA&s",
              fit: BoxFit.cover,
            ),
            // //  avatarBuilder: Image.network("https://e7.pngegg.com/pngimages/917/135/png-clipart-resident-evil-4-leon-s-kennedy-n-o-v-a-legacy-android-computer-icons-android-data-film-thumbnail.png",
            // //   fit: BoxFit.cover,),
          ),
        ),
      ),
    );
  }
}
