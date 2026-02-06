import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/color_manager.dart';
import '../../../../core/theme/text_styles.dart';

class CustomFormField extends StatefulWidget {
  const CustomFormField({
    super.key,
    required this.hint,
    required this.controller,
    this.isPassword = false,
    required this.validator,
  });
  final String hint;
  final TextEditingController controller;
  final bool isPassword;
  final String? Function(String? value) validator;

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  late bool isObscured;
  @override
  void initState() {
    isObscured = widget.isPassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h),
      child: TextFormField(
        textInputAction: TextInputAction.next,
        validator: widget.validator,
        controller: widget.controller,
        obscureText: isObscured,
        cursorColor: ColorManager.black23,
        style: TextStyles.font14W400,
        decoration: InputDecoration(
          errorStyle: TextStyles.font12W400.copyWith(color: Colors.red),
          hint: Text(
            widget.hint,
            style: TextStyles.font14W400.copyWith(color: ColorManager.gray98),
          ),
          filled: true,
          fillColor: ColorManager.grayF6,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide.none,
          ),
          suffixIcon: widget.isPassword
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isObscured = !isObscured;
                    });
                  },
                  icon: Icon(
                    isObscured ? Icons.visibility_off : Icons.visibility,
                    color: ColorManager.gray98,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
