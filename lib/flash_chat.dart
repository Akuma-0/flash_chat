import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'core/theme/color_manager.dart';

class FlashChat extends StatelessWidget {
  const FlashChat({super.key, required this.appRouter});
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flash Chat',
        onGenerateRoute: appRouter.generaterRoute,
        initialRoute:  Routes.signUp,
        theme: ThemeData(
          scaffoldBackgroundColor: ColorManager.white,
          appBarTheme: AppBarTheme(
            backgroundColor: ColorManager.white,
            elevation: 0,
            scrolledUnderElevation: 0,
            iconTheme: IconThemeData(color: ColorManager.black23),
            foregroundColor: ColorManager.black23,
          ),
        ),
      ),
    );
  }
}
