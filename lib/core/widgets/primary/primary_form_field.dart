import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../theme/colors.dart';

class PrimaryTextFormField extends StatelessWidget {
  final String validationError;
  final String? label;
  final String? hint;
  final TextEditingController? controller;
  final ValueChanged<String>? onFieldSubmitted;
  final bool isPassword;
  final GestureTapCallback? onTap;
  final bool enabled;
  final String? initialValue;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool infiniteLines;
  final bool isValidate;
  final Function(String)? onChange;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final Function(String?)? validator;
  final bool isAutoValidate;
  final bool isReadOnly;

  const PrimaryTextFormField({
    super.key,
    required this.validationError,
    this.label,
    this.hint,
    this.controller,
    this.onFieldSubmitted,
    this.isPassword = false,
    this.onTap,
    this.initialValue,
    this.enabled = true,
    this.suffixIcon,
    this.prefixIcon,
    this.infiniteLines = false,
    this.isValidate = true,
    this.onChange,
    this.inputFormatters,
    this.keyboardType,
    this.validator,
    this.isAutoValidate = false,
    this.isReadOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      enabled: enabled,
      onTap: onTap,
      readOnly: isReadOnly,
      obscuringCharacter: '*',
      autovalidateMode: isAutoValidate
          ? AutovalidateMode.onUserInteraction
          : AutovalidateMode.disabled,
      validator: isValidate
          ? (value) {
              if (validator != null) {
                return validator!(value);
              }
              if (value!.isEmpty) {
                return validationError;
              }
              return null;
            }
          : null,
      controller: controller,
      obscureText: isPassword,
      maxLines: infiniteLines ? null : 1,
      keyboardType: keyboardType,
      onChanged: onChange,
      onTapOutside: (event) {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      inputFormatters: inputFormatters,
      onFieldSubmitted: onFieldSubmitted,
      decoration: setupTextFormFieldStyle(),
    );
  }

  InputDecoration setupTextFormFieldStyle() {
    return InputDecoration(
      labelStyle: TextStyle(
        fontSize: 16.sp,
        fontFamily:'Urbanist',
        color: ColorsManager.black,
        fontWeight: FontWeight.w600,
      ),
      isDense: true,
      labelText: label,
      hintText: hint,
      hintStyle: const TextStyle(
        fontSize: 16,
        color: ColorsManager.gray500,
        fontWeight: FontWeight.w400,
      ),
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      errorMaxLines: 3,
      border: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: ColorsManager.black,
        ),
      ),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: ColorsManager.black,
        ),
      ),
      disabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: ColorsManager.gray200,
        ),
      ),
    );
  }
}
