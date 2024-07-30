import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ringo_dev_task/core/theme/colors.dart';
import 'package:ringo_dev_task/core/theme/text_styles.dart';
import 'package:ringo_dev_task/core/utils/spacing.dart';
import 'package:ringo_dev_task/core/widgets/my_svg.dart';

class ScheduleTaskItem extends StatelessWidget {
  final Color backgroundColor;
  final Color constrastColor;
  final String title;
  final String time;
  final String startTime;
  final String endTime;
  final bool isHasTask;

  const ScheduleTaskItem({
    super.key,
    required this.backgroundColor,
    required this.constrastColor,
    required this.title,
    required this.time,
    required this.startTime,
    required this.endTime,
    this.isHasTask = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          time,
          style: TextStyles.font12Weight500Black,
        ),
        horizontalSpace(9),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 1.h,
                color: ColorsManager.gray200,
              ),
              if (!isHasTask) verticalSpace(70),
              if (isHasTask)
                Container(
                  clipBehavior: Clip.hardEdge,
                  margin: EdgeInsets.only(left: 16.w),
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 6.w,
                        color: constrastColor,
                        height: 70.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 12.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: TextStyles.font14Black600Weight,
                            ),
                            verticalSpace(4),
                            Row(
                              children: [
                                const MySvg(image: 'time'),
                                horizontalSpace(8),
                                Text(
                                  '$startTime - $endTime',
                                  style: TextStyles.font12Weight500Gray500,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
