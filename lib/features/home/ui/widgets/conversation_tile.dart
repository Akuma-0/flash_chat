import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/models/conversation_model.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/color_manager.dart';
import '../../../../core/theme/text_styles.dart';

class ConversationTile extends StatelessWidget {
  const ConversationTile({super.key, required this.data});
  final ConversationModel data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 11.h),
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(
            context,
            Routes.chat,
            arguments: {
              'reciver':
                  data.users[data.participantIds.firstWhere(
                    (id) => id != FirebaseAuth.instance.currentUser!.uid,
                  )],
              'sender': data.users[FirebaseAuth.instance.currentUser!.uid],
            },
          );
        },
        minTileHeight: 74.h,
        minVerticalPadding: 16.h,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        tileColor: ColorManager.grayF6,
        leading: SizedBox(
          height: 50.h,
          width: 50.w,
          child: CircleAvatar(
            radius: 30.r,
            backgroundColor: ColorManager.white,
            child: CachedNetworkImage(
              imageUrl:
                  data
                      .users[data.participantIds.firstWhere(
                        (id) => id != FirebaseAuth.instance.currentUser!.uid,
                      )]
                      ?.profilePictureUrl ??
                  '',
              placeholder: (_, _) =>
                  Icon(Icons.person, color: ColorManager.black23, size: 42.sp),
              errorWidget: (_, _, _) =>
                  Icon(Icons.person, color: ColorManager.black23, size: 42.sp),
            ),
          ),
        ),
        title: Text(
          data
                  .users[data.participantIds.firstWhere(
                    (id) => id != FirebaseAuth.instance.currentUser!.uid,
                  )]
                  ?.name ??
              'Unknown User',
          style: TextStyles.font14W600,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          data.lastMessage.content,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyles.font12W400.copyWith(color: ColorManager.gray86),
        ),
        trailing: Text(
          '${data.lastMessage.timestamp.hour}:${data.lastMessage.timestamp.minute.toString().padLeft(2, '0')}',
          maxLines: 1,
          style: TextStyles.font10W400.copyWith(color: ColorManager.gray86),
        ),
      ),
    );
  }
}
