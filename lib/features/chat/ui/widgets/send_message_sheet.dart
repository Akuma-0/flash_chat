import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/color_manager.dart';
import '../../../../core/theme/text_styles.dart';
import '../../logic/cubit/chat_cubit.dart';

class SendMessageSheet extends StatelessWidget {
  const SendMessageSheet({super.key, required this.onSendPressed});
  final VoidCallback onSendPressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        return Container(
          color: ColorManager.grayF6,
          padding: EdgeInsets.symmetric(horizontal: 23.w),
          width: double.infinity,
          height: 84.h,
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.add, size: 24.sp),
                style: IconButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: ColorManager.white,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: TextField(
                  enabled: state is! Sending,
                  controller: context.read<ChatCubit>().messageController,
                  style: TextStyles.font14W400,
                  cursorColor: ColorManager.black23,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: ColorManager.white,
                    hintText: 'Write message...',
                    hintStyle: TextStyles.font14W400.copyWith(
                      color: ColorManager.gray80,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(26.r),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: GestureDetector(
                      onTap: onSendPressed,
                      child: Icon(Icons.send, size: 24.sp),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
