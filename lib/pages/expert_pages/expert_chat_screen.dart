import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:provider/provider.dart';
import 'package:seujcare/models/chat_model.dart';
import 'package:seujcare/models/query_model.dart';
import 'package:seujcare/providers/chat_provider.dart';

class ExpertChatScreen extends StatefulWidget {
  final QueryModel model;
  const ExpertChatScreen({
    super.key,
    required this.model,
  });

  @override
  State<ExpertChatScreen> createState() => _ExpertChatScreenState();
}

class _ExpertChatScreenState extends State<ExpertChatScreen> {
  List<types.Message> _messages = [];

  @override
  void initState() {
    getChatData();
    super.initState();
  }

  Future<void> getChatData() async {
    Provider.of<ChatProvider>(context, listen: false)
        .fetchChatHistory(widget.model.assignedTo, widget.model.createdBy);
    var provider2 = Provider.of<ChatProvider>(context, listen: false);

    _messages = provider2.chatHistory
        .map(
          (e) => types.TextMessage(
              author: types.User(id: e.receiverId),
              id: e.senderId,
              text: e.message),
        )
        .toList();

    print(_messages.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/tomatoe.webp'),
              ),
              Gap(10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.model.createdBy,
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    widget.model.timestamp.toString(),
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              )
            ],
          ),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Iconsax.arrow_left),
          ),
        ),
        body: Chat(
            messages: _messages,
            onSendPressed: _handleSendPressed,
            user: types.User(id: widget.model.assignedTo)));
  }

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _handleSendPressed(types.PartialText message) async {
    var provider = Provider.of<ChatProvider>(context, listen: false);
    final textMessage = types.TextMessage(
      author: types.User(id: widget.model.assignedTo),
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: DateTime.now().toString(),
      text: message.text,
    );

    var chatModel = ChatModel(
        senderId: widget.model.assignedTo,
        receiverId: widget.model.createdBy,
        message: message.text,
        content: '',
        timestamp: DateTime.timestamp());

    var result = await provider.sendMessage(chatModel);
    if (result == null) {
      print('Message sent');
    } else {
      print(result);
    }

    _addMessage(textMessage);
  }
}
