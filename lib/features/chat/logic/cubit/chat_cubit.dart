import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/core/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/models/user_model.dart';
import '../../data/chat_service.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  final ChatService _chatServices = ChatService();
  final TextEditingController messageController = TextEditingController();
  Future<void> sendMessage({
    required UserModel reciever,
  }) async {
    if (messageController.text.trim().isEmpty) {
      return;
    }
    emit(Sending());
    try {
      await _chatServices.sendMessage(
        sender: currentUser,
        reciever: reciever,
        content: messageController.text,
      );
      emit(Success());
      messageController.clear();
    } on FirebaseException catch (e) {
      emit(Failure(e.message ?? 'An error occurred'));
    } catch (e) {
      emit(Failure(e.toString()));
    }
  }
}
