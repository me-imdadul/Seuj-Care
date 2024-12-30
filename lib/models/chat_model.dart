// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ChatModel {
  final String senderId;
  final String receiverId;
  final String message;
  final dynamic content;
  final DateTime timestamp;
  ChatModel({
    required this.senderId,
    required this.receiverId,
    required this.message,
    required this.content,
    required this.timestamp,
  });

  Map<dynamic, dynamic> toMap() {
    return <dynamic, dynamic>{
      'senderId': senderId,
      'receiverId': receiverId,
      'message': message,
      'content': content,
      'timestamp': timestamp.millisecondsSinceEpoch,
    };
  }

  factory ChatModel.fromMap(Map<dynamic, dynamic> map) {
    return ChatModel(
      senderId: map['senderId'] as String,
      receiverId: map['receiverId'] as String,
      message: map['message'] as String,
      content: map['content'] as dynamic,
      timestamp: DateTime.fromMillisecondsSinceEpoch(map['timestamp'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatModel.fromJson(String source) =>
      ChatModel.fromMap(json.decode(source) as Map<dynamic, dynamic>);
}
