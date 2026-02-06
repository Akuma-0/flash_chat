import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/color_manager.dart';
import '../../../../core/theme/text_styles.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.search);
      },
      child: SizedBox(
        height: 44.h,
        child: TextField(
          decoration: InputDecoration(
            hint: Text(
              'Search here...',
              style: TextStyles.font14W400.copyWith(color: ColorManager.gray86),
            ),
            enabled: false,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: ColorManager.grayF6,
            suffixIcon: Container(
              padding: EdgeInsets.all(0),
              decoration: BoxDecoration(
                color: ColorManager.black23,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(Icons.search, color: ColorManager.white, size: 30.sp),
            ),
          ),
        ),
      ),
    );
  }
}
