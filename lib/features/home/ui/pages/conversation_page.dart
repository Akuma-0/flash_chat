import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/core/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/models/conversation_model.dart';
import '../../../../core/theme/text_styles.dart';
import '../widgets/conversation_tile.dart';
import '../widgets/search.dart';

class ConversationPage extends StatelessWidget {
  const ConversationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.h),
        Text('Chats', style: TextStyles.font24W700),
        SizedBox(height: 23.h),
        Search(),
        SizedBox(height: 25.h),
        Expanded(
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection(FirebaseConstants.conversationsCollection)
                .where(
                  'participantIds',
                  arrayContains: FirebaseAuth.instance.currentUser!.uid,
                )
                .orderBy('updatedAt', descending: true)
                .snapshots(),
            builder: (context, snapshot) {
              return (snapshot.data?.docs.isEmpty ?? true)
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.message, size: 50.sp),
                          SizedBox(height: 10.h),
                          Text(
                            'No conversations yet',
                            style: TextStyles.font24W700,
                          ),
                        ],
                      ),
                    )
                  : Material(
                      color: Colors.transparent,
                      child: ListView.builder(
                        itemBuilder: (context, index) => ConversationTile(
                          data: ConversationModel.fromJson(
                            snapshot.data!.docs[index].data(),
                            snapshot.data!.docs[index].id,
                          ),
                        ),
                        itemCount: snapshot.data!.docs.length,
                      ),
                    );
            },
          ),
        ),
      ],
    );
  }
}
