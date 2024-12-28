import 'package:flutter/material.dart';
import 'package:seujcare/models/chat_model.dart';
import 'package:seujcare/repository/chat_repository.dart';

class ChatProvider with ChangeNotifier {
  var repository = ChatRepository();
  List<ChatModel> _chats = [];

  List<ChatModel> get chatHistory => _chats;

  Future<String?> sendMessage(ChatModel chat) async {
    var response = await repository.sendMessage(chat);
    notifyListeners();
    return response;
  }

  void fetchChatHistory(String userId, String receviverId) async {
    _chats = await repository.fetchChatHistory(userId, receviverId);
    notifyListeners();
  }
}
