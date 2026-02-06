import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String content;
  final String type;
  final String senderId;
  final DateTime timestamp;

  MessageModel({
    required this.content,
    required this.type,
    required this.senderId,
    required this.timestamp,
  });

  factory MessageModel.fromJson(Map<String, dynamic> map,) {
    return MessageModel(
      content: map['content'] ?? '',
      type: map['type'] ?? 'text',
      senderId: map['senderId'] ?? '',
      timestamp: (map['timestamp'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'content': content,
      'type': type,
      'senderId': senderId,
      'timestamp': timestamp,
    };
  }
}