import 'package:flash_chat/core/models/user_model.dart';
import 'package:flash_chat/features/home/ui/widgets/profile_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/text_styles.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.h),
        Text('Profile', style: TextStyles.font24W700),
        SizedBox(height: 66.h),
        ProfileData(
          user: UserModel(
            name: 'name',
            email: 'email',
            uid: 'uid',
            profilePictureUrl: 'profilePictureUrl',
          ),
        ),
      ],
    );
  }
}
