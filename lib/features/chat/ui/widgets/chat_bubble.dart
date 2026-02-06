import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/models/message_model.dart';
import '../../../../core/theme/color_manager.dart';
import '../../../../core/theme/text_styles.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
    required this.isSentByMe,
    required this.message,
  });
  final bool isSentByMe;
  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: (isSentByMe) ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(bottom: 16.h),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
        constraints: BoxConstraints(maxWidth: 257.w),
        decoration: BoxDecoration(
          color: isSentByMe ? ColorManager.black23 : ColorManager.grayF6,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(16.r),
            bottomLeft: Radius.circular(16.r),
            bottomRight: isSentByMe ? Radius.zero : Radius.circular(16.r),
            topLeft: isSentByMe ? Radius.circular(16.r) : Radius.zero,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              message.content,
              style: TextStyles.font12W400.copyWith(
                color: isSentByMe ? ColorManager.white : ColorManager.black23,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              TimeOfDay.fromDateTime(message.timestamp).format(context),
              style: TextStyles.font10W400.copyWith(
                color: isSentByMe ? ColorManager.white : ColorManager.black23,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
