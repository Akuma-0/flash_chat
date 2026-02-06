import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/routing/routes.dart';
import '../../logic/cubit/auth_cubit.dart';
import 'auth_loading.dart';

class LoginBlocListner extends StatelessWidget {
  const LoginBlocListner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) {
        return current is SignInFailure ||
            current is SignInSuccess ||
            current is SignInLoading;
      },
      listener: (context, state) {
        switch (state) {
          case SignInLoading():
            showDialog(context: context, builder: (context) => AuthLoading());
          case SignInSuccess():
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.home,
              (_) => false,
            );
          case SignInFailure():
                        ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
            Navigator.of(context).pop();
          default:
            break;
        }
      },
      child: SizedBox(),
    );
  }
}
