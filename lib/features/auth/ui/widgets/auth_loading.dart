import 'package:flutter/material.dart';
import '../../../../core/theme/color_manager.dart';

class AuthLoading extends StatelessWidget {
  const AuthLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(color: ColorManager.black23),
    );
  }
}
