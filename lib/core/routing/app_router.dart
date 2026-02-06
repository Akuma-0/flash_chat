import 'package:flash_chat/features/auth/logic/cubit/auth_cubit.dart';
import 'package:flash_chat/features/home/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/auth/ui/screens/login_screen.dart';
import '../../features/auth/ui/screens/sign_up_screen.dart';
import 'routes.dart';

class AppRouter {
  Route<dynamic> generaterRoute(RouteSettings settings) {
    // final args = settings.arguments as Map<String, dynamic>? ?? {};
    switch (settings.name) {
      // case Routes.home:
      //   return MaterialPageRoute(builder: (_) => const HomeScreen());
      // case Routes.search:
      // return MaterialPageRoute(
      //   builder: (_) => BlocProvider(
      //     create: (context) => SearchCubit(),
      //     child: const SearchScreen(),
      //   ),
      // );
      // case Routes.chat:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (context) => ChatCubit(),
      //       child: ChatScreen(
      //         sender: args['sender'],
      //         reciver: args['reciver'],
      //       ),
      //     ),
      //   );
      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AuthCubit(),
            child: const LoginScreen(),
          ),
        );
      case Routes.signUp:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AuthCubit(),
            child: const SignUpScreen(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('No route defined'))),
        );
    }
  }
}
