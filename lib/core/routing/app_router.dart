import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/auth/logic/cubit/auth_cubit.dart';
import '../../features/auth/ui/screens/login_screen.dart';
import '../../features/auth/ui/screens/sign_up_screen.dart';
import '../../features/chat/logic/cubit/chat_cubit.dart';
import '../../features/chat/ui/chat_screen.dart';
import '../../features/home/logic/cubit/home_cubit.dart';
import '../../features/home/ui/home_screen.dart';
import '../../features/search/logic/cubit/search_cubit.dart';
import '../../features/search/ui/search_screen.dart';
import '../models/user_model.dart';
import 'routes.dart';

class AppRouter {
  Route<dynamic> generaterRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => HomeCubit(),
            child: const HomeScreen(),
          ),
        );
      case Routes.search:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => SearchCubit(),
            child: const SearchScreen(),
          ),
        );
      case Routes.chat:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => ChatCubit(),
            child: ChatScreen(
              reciver: settings.arguments as UserModel,
            ),
          ),
        );
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
