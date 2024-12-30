import 'package:hive/hive.dart';
import 'package:seujcare/models/chat_model.dart';

class ChatRepository {
  Box box = Hive.box('myBox');

  // Send Chat Message
  Future<String?> sendMessage(ChatModel chat) async {
    try {
      List<Map<dynamic, dynamic>> list = List<Map<dynamic, dynamic>>.from(
          box.get('messages', defaultValue: []));
      list.add(chat.toMap());
      await box.put('messages', list);
      return null;
    } catch (e) {
      return 'Something went wrong. $e';
    }
  }

  // Fetch Chat History
  Future<List<ChatModel>> fetchChatHistory(
      String userId, String contactId) async {
    try {
      List<Map<dynamic, dynamic>> list = List<Map<dynamic, dynamic>>.from(
          box.get('messages', defaultValue: []));

      var lists = list.where((chat) =>
          chat['senderId'] == userId && chat['receiverId'] == contactId);
      var res = lists.map((e) => ChatModel.fromMap(e)).toList();
      return res;
    } catch (e) {
      return [];
    }
  }
}
