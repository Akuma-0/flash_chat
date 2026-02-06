import 'package:flutter/material.dart';

import '../../../../core/helpers/app_regex.dart';
import 'custom_form_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
  });
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomFormField(
            hint: 'Enter email',
            controller: emailController,
            validator: (String? email) {
              if (email == null || email.isEmpty) {
                return 'Please enter your email';
              }
              return (AppRegex.isEmailValid(email))
                  ? null
                  : 'Please enter a valid email';
            },
          ),
          CustomFormField(
            hint: 'Enter password',
            controller: passwordController,
            isPassword: true,
            validator: (String? password) {
              if (password == null || password.isEmpty) {
                return 'Please enter your password';
              }
              return (AppRegex.isPasswordValid(password))
                  ? null
                  : 'Password must be at least 8 characters, include an uppercase letter, number and symbol';
            },
          ),
        ],
      ),
    );
  }
}
