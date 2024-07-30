
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ringo_dev_task/core/theme/colors.dart';
import 'package:ringo_dev_task/core/theme/text_styles.dart';
import 'package:ringo_dev_task/core/utils/spacing.dart';

class TabItem extends StatelessWidget {
  final VoidCallback? onTap;
  final String title;
  final bool isSelected;
  const TabItem({
    super.key, this.onTap, required this.title, required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
           Text(
            title,
            style:isSelected? TextStyles.font18Weight700Black : TextStyles.font18Weight700Gray500,
          ),
          verticalSpace(12),
          Container(
            color:isSelected? ColorsManager.black : Colors.transparent,
            height: 1.5.h,
          ),
        ],
      ),
    );
  }
}
