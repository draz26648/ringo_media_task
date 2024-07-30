import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ringo_dev_task/core/theme/text_styles.dart';
import 'package:ringo_dev_task/core/utils/spacing.dart';
import 'package:ringo_dev_task/core/widgets/my_svg.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.symmetric(
          vertical: 16.h, horizontal: 16.w),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              offset: const Offset(4, 8),
              blurRadius: 24,
              spreadRadius: 0,
            ),
          ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Meeting Concept',
                style: TextStyles.font16Black500Weight,
              ),
              verticalSpace(4),
              const Text(
                'Due Date : Mon, 12 Jan 2023',
                style: TextStyles.font12Weight400Black,
              ),
            ],
          ),
          const Spacer(),
          const MySvg(image: 'tick'),
        ],
      ),
    );
  }
}
