import 'package:flash_chat/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

class HomeError extends StatelessWidget {
  const HomeError({super.key, required this.errorMessage});
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorMessage,
        style: TextStyles.font24W700.copyWith(color: Colors.red),
      ),
    );
  }
}
