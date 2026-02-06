import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/color_manager.dart';
import '../../../../core/theme/text_styles.dart';
import '../widgets/auth_button.dart';
import '../widgets/login_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final GlobalKey<FormState> formKey;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 22.w, right: 22.w, top: 43.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Login', style: TextStyles.font26W700),
                Text(
                  'Please Log In To Your Account!',
                  style: TextStyles.font14W400.copyWith(
                    color: ColorManager.gray98,
                  ),
                ),
                SizedBox(height: 15.h),
                LoginForm(
                  emailController: emailController,
                  passwordController: passwordController,
                  formKey: formKey,
                ),
                AuthButton(onPressed: validateThenSubmit, text: 'Login'),
                SizedBox(height: 15.h),
                Text(
                  'Don\'t have account?',
                  style: TextStyles.font14W400.copyWith(
                    color: ColorManager.gray80,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text('Sign up', style: TextStyles.font14W600),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenSubmit() {
    if (formKey.currentState?.validate() ?? false) {
      FocusScope.of(context).unfocus();
    }
  }
}
