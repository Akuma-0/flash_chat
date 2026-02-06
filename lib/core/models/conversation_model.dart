import 'package:cloud_firestore/cloud_firestore.dart';
import 'message_model.dart';
import 'user_model.dart';

class ConversationModel {
  final String id;
  final List<String> participantIds;
  final MessageModel lastMessage;
  final DateTime updatedAt;
  final Map<String, UserModel> users;

  ConversationModel({
    required this.id,
    required this.participantIds,
    required this.lastMessage,
    required this.updatedAt,
    required this.users,
  });

  factory ConversationModel.fromJson(
    Map<String, dynamic> data,
    String documentId,
  ) {
    return ConversationModel(
      id: documentId,
      participantIds: List<String>.from(data['participantIds'] ?? []),
      lastMessage: MessageModel.fromJson(
        Map<String, dynamic>.from(data['lastMessage'] ?? {}),
      ),
      updatedAt: (data['updatedAt'] as Timestamp).toDate(),
      users: {
        for (var entry in (data['users'] as Map<String, dynamic>).entries)
          entry.key: UserModel.fromMap(Map<String, dynamic>.from(entry.value)),
      },
    );
  }
}
