import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/color_manager.dart';
import '../../../core/theme/text_styles.dart';
import '../logic/cubit/search_cubit.dart';
import 'widgets/search_bloc_builder.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 70.w,
        leading: IconButton(
          style: IconButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: ColorManager.grayF6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          icon: Icon(Icons.arrow_back_ios_new, size: 24.sp),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(height: 25.h),
            TextField(
              controller: context.read<SearchCubit>().searchController,
              decoration: InputDecoration(
                hint: Text(
                  'Search here...',
                  style: TextStyles.font14W400.copyWith(
                    color: ColorManager.gray86,
                  ),
                ),
                suffixIcon: Icon(Icons.search, size: 24.sp),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: ColorManager.grayF6,
              ),
              onChanged: (value) {
                context.read<SearchCubit>().searchUsers();
              },
            ),
            SizedBox(height: 25.h),
            Expanded(
              child: Material(
                color: Colors.transparent,
                child: SearchBlocBuilder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
