import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/models/user_model.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/color_manager.dart';
import '../../../../core/theme/text_styles.dart';

class UserTile extends StatelessWidget {
  const UserTile({super.key, required this.user});
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 11.h),
      child: ListTile(
        tileColor: ColorManager.grayF6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        minTileHeight: 74.h,
        minVerticalPadding: 16.h,
        leading: SizedBox(
          height: 50.h,
          width: 50.w,
          child: CircleAvatar(
            radius: 30.r,
            backgroundColor: ColorManager.white,
            child: CachedNetworkImage(
              imageUrl: user.profilePictureUrl,
              placeholder: (_, _) =>
                  Icon(Icons.person, color: ColorManager.black23, size: 42.sp),
              errorWidget: (_, _, _) =>
                  Icon(Icons.person, color: ColorManager.black23, size: 42.sp),
            ),
          ),
        ),
        title: Text(
          user.name,
          style: TextStyles.font14W600,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        onTap: () {
          Navigator.pushNamed(
            context,
            Routes.chat,
            arguments: {'sender': '', 'reciver': user},
          );
        },
      ),
    );
  }
}
