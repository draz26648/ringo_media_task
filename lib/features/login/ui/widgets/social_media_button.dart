import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ringo_dev_task/core/theme/colors.dart';
import 'package:ringo_dev_task/core/widgets/my_svg.dart';
import 'package:ringo_dev_task/core/widgets/primary/primary_button.dart';

class SocialMediaButton extends StatelessWidget {
  final String text;
  final String icon;
  final VoidCallback onPressed;
  const SocialMediaButton(
      {super.key,
      required this.text,
      required this.icon,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      text: text,
      isWithBorder: true,
      backgroundColor: Colors.white,
      textColor: ColorsManager.black,
      isOutlineButton: true,
      borderColor: ColorsManager.gray200,
      borderWidth: 1.5.w,
      loadingProgressColor: ColorsManager.black,
      prefixIcon: SizedBox(
        width: 24.w,
        height: 24.h,
        child: MySvg(image: icon),
      ),
      onPressed: onPressed,
    );
  }
}
