import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../core/helpers/constants.dart';
import '../../../core/helpers/helper_functions.dart';
import '../../../core/models/user_model.dart';

class ChatService {
  ChatService._();
  static final ChatService instance = ChatService._();
  factory ChatService() => instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> sendMessage({
    required UserModel reciever,
    required String content,
    bool isImage = false,
  }) async {
    final String chatId = getChatId(currentUser.uid, reciever.uid);
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
      'senderId': currentUser.uid,
      'timestamp': now,
      'type': isImage ? 'image' : 'text',
    });

    batch.set(conversationDoc, {
      'participantIds': [currentUser.uid, reciever.uid],
      'users': {currentUser.uid: currentUser.toMap(), reciever.uid: reciever.toMap()},
      'lastMessage': {
        'content': content,
        'senderId': currentUser.uid,
        'timestamp': now,
      },
      'updatedAt': now,
    }, SetOptions(merge: true));
    await batch.commit();
  }
}
