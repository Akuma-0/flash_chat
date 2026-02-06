import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/color_manager.dart';

class HomeNavBar extends StatelessWidget {
  const HomeNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });
  final int currentIndex;
  final void Function(int index) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84.h,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha((0.09 * 255).toInt()),
            blurRadius: 50.r,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.r),
          topRight: Radius.circular(40.r),
        ),
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: currentIndex,
          onTap: onTap,
          backgroundColor: ColorManager.white,
          elevation: 10,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/stories.png',
                width: 24.w,
                height: 24.h,
              ),
              activeIcon: Image.asset(
                'assets/images/stories_active.png',
                width: 24.w,
                height: 24.h,
              ),
              label: 'Stories',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/conversations.png',
                width: 24.w,
                height: 24.h,
              ),
              activeIcon: Image.asset(
                'assets/images/conversations_active.png',
                width: 24.w,
                height: 24.h,
              ),
              label: 'Conversations',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/profile.png',
                width: 24.w,
                height: 24.h,
              ),
              activeIcon: Image.asset(
                'assets/images/profile_active.png',
                width: 24.w,
                height: 24.h,
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
