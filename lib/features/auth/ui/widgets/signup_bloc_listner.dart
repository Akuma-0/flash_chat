import 'package:flash_chat/core/routing/routes.dart';
import 'package:flash_chat/features/auth/logic/cubit/auth_cubit.dart';
import 'package:flash_chat/features/auth/ui/widgets/auth_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupBlocListner extends StatelessWidget {
  const SignupBlocListner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) {
        return current is SignUpFailure ||
            current is SignUpSuccess ||
            current is SignUpLoading;
      },

      listener: (context, state) {
        switch (state) {
          case SignUpLoading():
            showDialog(context: context, builder: (context) => AuthLoading());
          case SignUpSuccess():
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.home,
              (route) => false,
            );
          case SignUpFailure():
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
            Navigator.of(context).pop();
          default:
            Navigator.of(context).pop();
        }
      },
      child: SizedBox(),
    );
  }
}
