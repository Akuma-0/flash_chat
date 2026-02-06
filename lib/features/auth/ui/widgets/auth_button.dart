import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/color_manager.dart';
import '../../../../core/theme/text_styles.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({super.key, required this.onPressed, required this.text});
  final VoidCallback onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: ColorManager.black23,
          minimumSize: Size(double.infinity, 50.h),
          overlayColor: ColorManager.black44,
        ),
        child: Text(
          text,
          style: TextStyles.font14W600.copyWith(color: ColorManager.white),
        ),
      ),
    );
  }
}
