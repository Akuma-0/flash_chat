import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/color_manager.dart';
import '../../../../core/theme/text_styles.dart';
import '../widgets/auth_button.dart';
import '../widgets/sign_up_form.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late final GlobalKey<FormState> formKey;
  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;
  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
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
                Text('Create Your Account', style: TextStyles.font26W700),
                Text(
                  'Please Provide The Details!',
                  style: TextStyles.font14W400.copyWith(
                    color: ColorManager.gray98,
                  ),
                ),
                SizedBox(height: 15.h),
                SignUpForm(
                  nameController: nameController,
                  emailController: emailController,
                  passwordController: passwordController,
                  confirmPasswordController: confirmPasswordController,
                  formKey: formKey,
                ),
                AuthButton(onPressed: validateThenSubmit, text: 'Sign Up'),
                SizedBox(height: 15.h),
                Text(
                  'Already have account?',
                  style: TextStyles.font14W400.copyWith(
                    color: ColorManager.gray80,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.login);
                  },
                  child: Text('Login', style: TextStyles.font14W600),
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
