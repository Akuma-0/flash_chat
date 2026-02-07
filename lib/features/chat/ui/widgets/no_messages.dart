import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/color_manager.dart';
import '../../../../core/theme/text_styles.dart';

class NoMessages extends StatelessWidget {
  const NoMessages({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}