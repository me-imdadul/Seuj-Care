import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class ExpertChatScreen extends StatefulWidget {
  const ExpertChatScreen({super.key});

  @override
  State<ExpertChatScreen> createState() => _ExpertChatScreenState();
}

class _ExpertChatScreenState extends State<ExpertChatScreen> {
  final _user = const types.User(id: '82091008-a484-4a89-ae75-a22bf8d6f3ac');
  final List<types.Message> _messages = [];
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
                    'User',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    '12 jul, 2024 12;11 pm',
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
            user: _user));
  }

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: DateTime.now().toString(),
      text: message.text,
    );

    _addMessage(textMessage);
  }
}
