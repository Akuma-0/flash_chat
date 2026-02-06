import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flash_chat/core/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/helpers/helper_functions.dart';
import '../../../core/models/message_model.dart';
import '../../../core/models/user_model.dart';
import '../../../core/theme/color_manager.dart';
import '../../../core/theme/text_styles.dart';
import '../logic/cubit/chat_cubit.dart';
import 'widgets/chat_bubble.dart';
import 'widgets/send_message_sheet.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key, required this.reciver});
  final UserModel reciver;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 70.w,
        leading: IconButton(
          style: IconButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: ColorManager.grayF6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          icon: Icon(Icons.arrow_back_ios_new, size: 24.sp),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(reciver.name, style: TextStyles.font18W600),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('conversations')
            .doc(getChatId(currentUser.uid, reciver.uid))
            .collection('messages')
            .orderBy('timestamp', descending: true)
            .snapshots(),
        builder: (context, asyncSnapshot) {
          return (asyncSnapshot.data?.docs.isEmpty ?? true)
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.near_me_disabled_sharp,
                        size: 80.sp,
                        color: ColorManager.black23,
                      ),
                      SizedBox(height: 16.h),
                      Text('No messages yet', style: TextStyles.font24W700),
                    ],
                  ),
                )
              : ListView.builder(
                  reverse: true,
                  padding: EdgeInsets.only(
                    left: 19.w,
                    right: 19.w,
                    top: 16.h,
                    bottom: 90.h,
                  ),
                  itemBuilder: (context, index) => ChatBubble(
                    isSentByMe:
                        asyncSnapshot.data!.docs[index]['senderId'] ==
                        currentUser.uid,
                    message: MessageModel.fromJson(
                      asyncSnapshot.data!.docs[index].data(),
                    ),
                  ),
                  itemCount: asyncSnapshot.data!.docs.length,
                );
        },
      ),
      bottomSheet: SendMessageSheet(
        onSendPressed: () {
          context.read<ChatCubit>().sendMessage(
            reciever: reciver,
          );
        },
      ),
    );
  }
}
