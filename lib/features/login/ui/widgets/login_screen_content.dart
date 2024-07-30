import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ringo_dev_task/core/router/routes_strings.dart';
import 'package:ringo_dev_task/core/theme/text_styles.dart';
import 'package:ringo_dev_task/core/utils/extensions/build_context_extension.dart';
import 'package:ringo_dev_task/core/utils/spacing.dart';
import 'package:ringo_dev_task/core/widgets/my_svg.dart';
import 'package:ringo_dev_task/core/widgets/primary/primary_button.dart';
import 'package:ringo_dev_task/core/widgets/primary/primary_form_field.dart';
import 'package:ringo_dev_task/features/login/logic/cubit/login_cubit.dart';
import 'package:ringo_dev_task/features/login/ui/widgets/social_media_button.dart';

class LoginScreenContent extends StatefulWidget {
  const LoginScreenContent({super.key});

  @override
  State<LoginScreenContent> createState() => _LoginScreenContentState();
}

class _LoginScreenContentState extends State<LoginScreenContent> {
  bool isPasswordVisible = false;

  var fromKey = GlobalKey<FormState>();

  bool isEmailEmpty = true;

  bool isPasswordEmpty = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: fromKey,
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          state.whenOrNull(
            loginLoading: () {
              context.pushNamedAndRemoveUntil(Routes.bottomNavigation,
                  predicate: (route) => false);
            },
          );
        },
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Username / Email',
                style: TextStyles.font14Black600Weight,
              ),
              verticalSpace(8),
              PrimaryTextFormField(
                validationError: 'please enter your email or username',
                controller: context.read<LoginCubit>().emailController,
                hint: 'User name / Email',
                onChange: (value) {
                  if (value.isNotEmpty) {
                    setState(() {
                      isEmailEmpty = false;
                    });
                  } else {
                    setState(() {
                      isEmailEmpty = true;
                    });
                  }
                },
              ),
              verticalSpace(24),
              const Text(
                'Password',
                style: TextStyles.font14Black600Weight,
              ),
              verticalSpace(8),
              PrimaryTextFormField(
                validationError: 'please enter your password',
                controller: context.read<LoginCubit>().passwordController,
                isPassword: isPasswordVisible,
                onChange: (value) {
                  if (value.isNotEmpty) {
                    setState(() {
                      isPasswordEmpty = false;
                    });
                  } else {
                    setState(() {
                      isPasswordEmpty = true;
                    });
                  }
                },
                suffixIcon: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                      child: isPasswordVisible
                          ? const MySvg(
                              image: 'eye_active',
                            )
                          : const MySvg(
                              image: 'eye',
                            ),
                    ),
                  ],
                ),
                hint: 'Enter password here',
              ),
              verticalSpace(24),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text('Forgot Password?',
                      style: TextStyles.font14Black600Weight),
                ),
              ),
              verticalSpace(24),
              PrimaryButton(
                text: 'Login',
                isDisabled: (isEmailEmpty && isPasswordEmpty),
                loadingProgressColor: Colors.white,
                isLoading: state is LoginLoading,
                onPressed: () {
                  if (fromKey.currentState!.validate()) {
                    context.pushNamedAndRemoveUntil(Routes.bottomNavigation,
                        predicate: (route) => false);
                  }
                },
              ),
              verticalSpace(24),
              const Center(
                child: Text(
                  'Or login with account',
                  style: TextStyles.font12Weight600Gray500,
                ),
              ),
              verticalSpace(24),
              SocialMediaButton(
                icon: 'google',
                text: 'Continue with Google',
                onPressed: () {},
              ),
              verticalSpace(16),
              SocialMediaButton(
                icon: 'facebook',
                text: 'Continue with Facebook',
                onPressed: () {},
              ),
              verticalSpace(16),
              SocialMediaButton(
                icon: 'apple',
                text: 'Continue with Apple',
                onPressed: () {},
              ),
            ],
          );
        },
      ),
    );
  }
}
