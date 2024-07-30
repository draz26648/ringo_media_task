import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ringo_dev_task/core/theme/text_styles.dart';
import 'package:ringo_dev_task/core/utils/spacing.dart';
import 'package:ringo_dev_task/features/login/ui/widgets/login_screen_content.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Login',
                  style: TextStyles.font24Black700Weight,
                ),
                verticalSpace(8),
                const Text(
                  'Sign in to your account',
                  style: TextStyles.font14gray500Weight,
                ),
                verticalSpace(40),
                const LoginScreenContent(),
                verticalSpace(40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Dont’t have an account?',
                      style: TextStyles.font14gray500Weight,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Register Here',
                        style: TextStyles.font14Black700Weight,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
