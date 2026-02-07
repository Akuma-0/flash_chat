import 'package:cached_network_image/cached_network_image.dart';
import 'package:flash_chat/features/home/logic/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/models/user_model.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/color_manager.dart';
import '../../../../core/theme/text_styles.dart';

class ProfileData extends StatelessWidget {
  const ProfileData({super.key, required this.user});
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          CircleAvatar(
            radius: 60.r,
            backgroundColor: ColorManager.grayF6,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(60.r),
              child: CachedNetworkImage(
                imageUrl: user.profilePictureUrl,
                width: 120.w,
                height: 120.h,
                fit: BoxFit.cover,
                placeholder: (_, _) => Icon(
                  Icons.person,
                  color: ColorManager.black23,
                  size: 80.sp,
                ),
                errorWidget: (_, _, _) => Icon(
                  Icons.person,
                  color: ColorManager.black23,
                  size: 80.sp,
                ),
              ),
            ),
          ),
          SizedBox(height: 26.h),
          Text(user.name, style: TextStyles.font24W700),
          SizedBox(height: 10.h),
          Text(
            user.email,
            style: TextStyles.font14W400.copyWith(color: ColorManager.gray80),
          ),
          SizedBox(height: 100.h),
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.red,
              backgroundColor: ColorManager.black23,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              minimumSize: Size(double.infinity, 50.h),
            ),
            onPressed: () {
              context.read<HomeCubit>().signOut();
              Navigator.of(context).pushNamedAndRemoveUntil(
                Routes.signUp,
                (Route<dynamic> route) => false,
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.logout, size: 24.sp),
                SizedBox(width: 8.w),
                Text('Logout', style: TextStyles.font18W600),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
