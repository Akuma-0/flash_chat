import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../core/helpers/helper_functions.dart';
import '../../../core/models/user_model.dart';

class ChatService {
  ChatService._();
  static final ChatService instance = ChatService._();
  factory ChatService() => instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> sendMessage({
    required UserModel sender,
    required UserModel reciever,
    required String content,
    bool isImage = false,
  }) async {
    final String chatId = getChatId(sender.uid, reciever.uid);
    final Timestamp now = Timestamp.now();
    final WriteBatch batch = _db.batch();
    final DocumentReference conversationDoc = _db
        .collection('conversations')
        .doc(chatId);

    final DocumentReference messagesDoc = conversationDoc
        .collection('messages')
        .doc();
    batch.set(messagesDoc, {
      'content': content,
      'senderId': sender.uid,
      'timestamp': now,
      'type': isImage ? 'image' : 'text',
    });

    batch.set(conversationDoc, {
      'participantIds': [sender.uid, reciever.uid],
      'users': {sender.uid: sender.toMap(), reciever.uid: reciever.toMap()},
      'lastMessage': {
        'content': content,
        'senderId': sender.uid,
        'timestamp': now,
      },
      'updatedAt': now,
    }, SetOptions(merge: true));
    await batch.commit();
  }
}
