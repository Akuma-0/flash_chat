import 'package:flash_chat/features/home/ui/widgets/home_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/text_styles.dart';
import '../logic/cubit/home_cubit.dart';
import 'pages/conversation_page.dart';
import 'pages/profile_page.dart';
import 'widgets/home_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return (state is GettingUserData)
                  ? HomeLoading()
                  : IndexedStack(
                      index: currentIndex,
                      children: [
                        Center(
                          child: Text('Stories', style: TextStyles.font24W700),
                        ),
                        ConversationPage(),
                        ProfilePage(),
                      ],
                    );
            },
          ),
        ),
      ),
      bottomNavigationBar: HomeNavBar(
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
