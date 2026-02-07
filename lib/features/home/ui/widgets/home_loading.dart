import 'package:flutter/material.dart';
import '../../../../core/theme/color_manager.dart';

class HomeLoading extends StatelessWidget {
  const HomeLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(color: ColorManager.black23),
    );
  }
}
